From: Platform Team regression test user <citrix-osstest@xenproject.org>
Subject: [ovmf baseline-only test] 74496: trouble: blocked/broken
Date: Fri, 6 Apr 2018 02:17:15 +0100
Message-ID: <osstest-74496-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1795050447880126857=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xensource.com, osstest-admin@xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============1795050447880126857==
Content-Type: text/plain

This run is configured for baseline tests only.

flight 74496 ovmf real [real]
http://osstest.xs.citrite.net/~osstest/testlogs/logs/74496/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-xsm                 <job status>                 broken
 build-i386                      <job status>                 broken
 build-amd64-pvops               <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-amd64                     <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-amd64-xsm               4 host-install(4)         broken REGR. vs. 72229
 build-amd64                   4 host-install(4)         broken REGR. vs. 72229
 build-amd64-pvops             4 host-install(4)         broken REGR. vs. 72229
 build-i386                    4 host-install(4)         broken REGR. vs. 72229
 build-i386-xsm                4 host-install(4)         broken REGR. vs. 72229
 build-i386-pvops              4 host-install(4)         broken REGR. vs. 72229

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a

version targeted for testing:
 ovmf                 c4172f80051effc62f3eceeeced4c0b66a80eb94
baseline version:
 ovmf                 a63be426f8e327181dda369348eae2768439536b

Last test of basis    72229  2017-10-11 23:48:00 Z  176 days
Testing same since    74496  2018-04-05 12:23:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Achin Gupta <achin.gupta@arm.com>
  Aleksei Kovura <alex3kov@zoho.com>
  Alex James <theracermaster@gmail.com>
  Ard Biesheuvel <ard.biesheuvel@linaro.org>
  Ard Biesheuvel <ard.biesheuvel@linaro.org> # ArmVirtQemu
  Arthur Heymans <arthur@aheymans.xyz>
  Bell Song <binx.song@intel.com>
  Benjamin You <benjamin.you@intel.com>
  Bi, Dandan <dandan.bi@intel.com>
  Bin Wang <binx.a.wang@intel.com>
  Bob Feng <bob.c.feng@Intel.com>
  BobCF <bob.c.feng@intel.com>
  Bret Barkelew <brbarkel@microsoft.com>
  Bret Barkelew <Bret.Barkelew@microsoft.com>
  Brijesh Singh <brijesh.singh@amd.com>
  Carsey, Jaben </o=Intel/ou=Americas01/cn=Workers/cn=Carsey, Jaben>
  Chao Zhang <chao.b.zhang@intel.com>
  Chao Zhang <chao.b.zhang@intel.com>'
  Chasel Chiu <chasel.chiu@intel.com>
  Chasel, Chiu <chasel.chiu@intel.com>
  Chema Gonzalez <chemag@fb.com>
  Chema Gonzalez <chemag@gmail.com>
  chenc2 <chen.a.chen@intel.com>
  Christian Ehrhardt <ehrhardt@genua.de>
  Dakota Chiang <dakota.chiang@intel.com>
  Dandan Bi <dandan.bi@intel.com>
  Daniil Egranov <daniil.egranov@arm.com>
  dann frazier <dann.frazier@canonical.com>
  Eric Dong <eric.dong@intel.com>
  Evan Lloyd <evan.lloyd@arm.com>
  fanwang2 <fan.wang@intel.com>
  Felix Polyudov <felixp@ami.com>
  Feng Bob C <bob.c.feng@intel.com>
  Feng, Bob C <bob.c.feng@intel.com>
  Feng, YunhuaX </o=Intel/ou=Exchange Administrative Group (FYDIBOHF23SPDLT)/cn=Recipients/cn=Feng, YunhuaX4e1>
  Feng, YunhuaX <yunhuax.feng@intel.com>
  From: Yunhua Feng <yunhuax.feng@intel.com>
  Fu Siyuan <siyuan.fu@intel.com>
  Gabriel Somlo <gsomlo@gmail.com>
  Gao, Liming <liming.gao@intel.com>
  Gary Lin <glin@suse.com>
  Ge Song <ge.song@hxt-semitech.com>
  Girish Pathak <girish.pathak@arm.com>
  Hao Wu <hao.a.wu@intel.com>
  Hess Chen <hesheng.chen@intel.com>
  Heyi Guo <heyi.guo@linaro.org>
  Huajing Li <huajing.li@intel.com>
  Jaben Carsey <jaben.carsey@intel.com>
  Jeff Brasen <jbrasen.qdt@qualcommdatacenter.com>
  Jian J Wang <jian.j.wang@intel.com>
  Jiaxin Wu <jiaxin.wu@intel.com>
  Jiewen Yao <jiewen.yao@intel.com>
  Julien Grall <julien.grall@linaro.org>
  Junbiao Hong <hongjunbiao@huawei.com>
  Karunakar P <karunakarp@amiindia.co.in>
  Kinney, Michael D <michael.d.kinney@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Leif Lindholm <leif.lindholm@linaro.org>
  Leo Duran <leo.duran@amd.com>
  Liang Vincent <vincent.liang@intel.com>
  Liao Jui-peng <jui-pengx.liao@intel.com>
  Liming Gao <liming.gao@intel.com>
  Long Qin <qin.long@intel.com>
  M1cha <sigmaepsilon92@gmail.com>
  Marc Zyngier <marc.zyngier@arm.com>
  Marc-Andr? Lureau <marcandre.lureau@redhat.com>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Marcin Wojtas <mw@semihalf.com>
  Marvin Haeuser <Marvin.Haeuser@outlook.com>
  Marvin.Haeuser@outlook.com <Marvin.Haeuser@outlook.com>
  Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>
  Michael D Kinney <michael.d.kinney@intel.com>
  Michael Kinney <michael.d.kinney@intel.com>
  Michael Turner <michael.turner@microsoft.com>
  Michael Zimmermann <sigmaepsilon92@gmail.com>
  Ming Huang <huangming23@huawei.com>
  Ming Huang <ming.huang@linaro.org>
  Pankaj Bansal <pankaj.bansal@nxp.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paulo Alcantara <pcacjr@zytor.com>
  Peicong Li <lipeicong@huawei.com>
  Pete Batard <pete@akeo.ie>
  Peter Jones <pjones@redhat.com>
  Pipat Methavanitpong <methavanitpong.pipat@socionext.com>
  Qin Long <qin.long@intel.com>
  Renhao Liang <liangrenhao@huawei.com>
  Richard W.M. Jones <rjones@redhat.com>
  Ruiyu Ni <ruiyu.ni@intel.com>
  Sean Brogan <sean.brogan@microsoft.com>
  Shannon Zhao <zhaoshenglong@huawei.com>
  Song, BinX <binx.song@intel.com>
  Star Zeng <star.zeng@intel.com>
  Supreeth Venkatesh <supreeth.venkatesh@arm.com>
  Thiebaud Weksteen <tweek@google.com>
  Thomas Lamprecht <t.lamprecht@proxmox.com>
  Udit Kumar <udit.kumar@nxp.com>
  Vabhav Sharma <vabhav.sharma@nxp.com>
  Wang Fan <fan.wang@intel.com>
  Wang, Jian J <jian.j.wang@intel.com>
  Wei, David <david.wei@intel.com>
  Wu Hao <hao.a.wu@intel.com>
  Wu Jiaxin <jiaxin.wu@intel.com>
  Xiang Zheng <xiang.zheng@linaro.org>
  Yi Li <phoenix.liyi@huawei.com>
  Yonghong Zhu <yonghong.zhu@intel.com>
  Yunhua Feng <yunhuax.feng@intel.com>
  Zenith432 <zenith432@users.sourceforge.net>
  Zhang, Chao B <chao.b.zhang@intel.com>
  Zhu, Yonghong <yonghong.zhu@intel.com>
  zwei4 <david.wei@intel.com>

jobs:
 build-amd64-xsm                                              broken  
 build-i386-xsm                                               broken  
 build-amd64                                                  broken  
 build-i386                                                   broken  
 build-amd64-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            broken  
 build-i386-pvops                                             broken  
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 


------------------------------------------------------------
sg-report-flight on osstest.xs.citrite.net
logs: /home/osstest/logs
images: /home/osstest/images

Logs, config files, etc. are available at
    http://osstest.xs.citrite.net/~osstest/testlogs/logs

Test harness code can be found at
    http://xenbits.xensource.com/gitweb?p=osstest.git;a=summary

broken-job build-amd64-xsm broken
broken-job build-i386 broken
broken-job build-amd64-pvops broken
broken-job build-i386-xsm broken
broken-job build-amd64 broken
broken-job build-i386-pvops broken
broken-step build-amd64-xsm host-install(4)
broken-step build-amd64 host-install(4)
broken-step build-amd64-pvops host-install(4)
broken-step build-i386 host-install(4)
broken-step build-i386-xsm host-install(4)
broken-step build-i386-pvops host-install(4)

Push not applicable.

(No revision log; it would be 23665 lines long.)


--===============1795050447880126857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1795050447880126857==--
