create table users(
    id varchar(100) primary key,
    email varchar(100) not null unique,
    password varchar(100) not null,
    name varchar(100),
    image text
);

create table sessions(
    id varchar(100) primary key,
    user_id varchar(100) not null,
    email varchar(100) not null,
    refresh_token text not null,
    nonce text unique,
    expires timestamp not null,
    ip_address varchar(100),
    device varchar(100),
    user_agent varchar(100),
    created timestamp not null,
    last_access timestamp not null,
    foreign key (user_id) references users(id) on delete cascade
);

create table revoked_access_tokens(
    id bigserial primary key,
    token text not null,
    revoked timestamp not null
);

create table roles(
    id serial primary key,
    name varchar(100) not null unique,
    description text,
    super_role boolean default false,
    default_role boolean default false
);

create table users_roles(
    user_id varchar(100) not null,
    role_id int not null,
    primary key (user_id, role_id),
    foreign key (user_id) references users(id) on delete cascade,
    foreign key (role_id) references roles(id) on delete cascade
);

create table tasks(
    id bigserial primary key,
    title varchar(100) not null,
    description text,
    status varchar(100) not null,
    priority int not null,
    "user" varchar(100) not null
);

create index tasks_status on tasks(status);
create index tasks_priority on tasks(priority);
create index tasks_user on tasks("user");

create table task_employees(
    id bigserial,
    task_id bigint not null,
    employee varchar(100),
    primary key (task_id, employee),
    foreign key (task_id) references tasks(id) on delete cascade
);

create table task_comments(
    id bigserial primary key,
    task_id bigint not null,
    parent_id bigint,
    content text not null,
    "user" varchar(100) not null,
    foreign key (task_id) references tasks(id) on delete cascade,
    foreign key (parent_id) references task_comments(id) on delete cascade
);

create index task_comments_task_id on task_comments(task_id);
create index task_comments_parent on task_comments(parent_id);
create index task_comments_user on task_comments("user");
