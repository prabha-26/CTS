import { Routes } from '@angular/router';
import { CourseListComponent } from './course-list.component';
import { CourseFormComponent } from './course-form.component';

export const routes: Routes = [
  { path: '', component: CourseListComponent },
  { path: 'add', component: CourseFormComponent }
];
