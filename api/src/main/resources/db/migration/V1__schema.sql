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
    task_id bigserial not null,
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
