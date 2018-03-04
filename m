From: osstest service owner <osstest-admin@xenproject.org>
Subject: [ovmf test] 120165: trouble: broken/pass
Date: Sun, 04 Mar 2018 11:41:53 +0000
Message-ID: <osstest-120165-mainreport@xen.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5274952623085014827=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=auwy=f2=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1esS1q-0002S4-3j
 for xen-devel@lists.xenproject.org; Sun, 04 Mar 2018 11:42:10 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, osstest-admin@xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============5274952623085014827==
Content-Type: text/plain

flight 120165 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/120165/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-ovmf-amd64    <job status>                 broken
 test-amd64-i386-xl-qemuu-ovmf-amd64  4 host-install(4) broken REGR. vs. 120113

version targeted for testing:
 ovmf                 8805bd904abd2f331d91cc4ae26fe3ee75a1fd0d
baseline version:
 ovmf                 2157bc9c8b8be30ada11fe2e64454157d3ae528f

Last test of basis   120113  2018-03-01 02:36:47 Z    3 days
Testing same since   120165  2018-03-02 17:19:56 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ard.biesheuvel@linaro.org>
  Dandan Bi <dandan.bi@intel.com>
  Felix Polyudov <felixp@ami.com>
  Feng, YunhuaX </o=Intel/ou=Exchange Administrative Group (FYDIBOHF23SPDLT)/cn=Recipients/cn=Feng, YunhuaX4e1>
  Jiaxin Wu <jiaxin.wu@intel.com>
  Jiewen Yao <jiewen.yao@intel.com>
  Liming Gao <liming.gao@intel.com>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Ruiyu Ni <ruiyu.ni@intel.com>
  Wu Jiaxin <jiaxin.wu@intel.com>
  Yonghong Zhu <yonghong.zhu@intel.com>
  Yunhua Feng <yunhuax.feng@intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          broken  


------------------------------------------------------------
sg-report-flight on osstest.test-lab.xenproject.org
logs: /home/logs/logs
images: /home/logs/images

Logs, config files, etc. are available at
    http://logs.test-lab.xenproject.org/osstest/logs

Explanation of these reports, and of osstest in general, is at
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master

Test harness code can be found at
    http://xenbits.xen.org/gitweb?p=osstest.git;a=summary

broken-job test-amd64-i386-xl-qemuu-ovmf-amd64 broken
broken-step test-amd64-i386-xl-qemuu-ovmf-amd64 host-install(4)

Not pushing.

------------------------------------------------------------
commit 8805bd904abd2f331d91cc4ae26fe3ee75a1fd0d
Author: Felix Polyudov <felixp@ami.com>
Date:   Fri Mar 2 23:48:30 2018 +0800

    MdePkg/Include/IndustryStandard: Add PCI Express 4.0 header file
    
    v3: LaneEqualizationControl is changed to be an array.
    
    v2: The structure is updated to include all the fields defined
    in the PCI-E specification.
    
    The header includes Physical Layer PCI Express Extended Capability definitions
    described in section 7.7.5 of PCI Express Base Specification rev. 4.0.
    
    Contributed-under: TianoCore Contribution Agreement 1.1
    Signed-off-by: Felix Polyudov <felixp@ami.com>
    Reviewed-by: Liming Gao <liming.gao@intel.com>

commit a39e72267034d0cae72be8741fff37f37e5da920
Author: Marc-André Lureau <marcandre.lureau@redhat.com>
Date:   Fri Feb 23 14:23:05 2018 +0100

    SecurityPkg/Tcg2Pei: drop Tcg2PhysicalPresenceLib dependency
    
    Apparently, unnecessary. Avoids extra build dependency and churn.
    
    CC: Laszlo Ersek <lersek@redhat.com>
    CC: Stefan Berger <stefanb@linux.vnet.ibm.com>
    Contributed-under: TianoCore Contribution Agreement 1.0
    Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
    Reviewed-by: Laszlo Ersek <lersek@redhat.com>
    Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>

commit 52b68f7d455a86baf8339939dea1f9eda726ac54
Author: Dandan Bi <dandan.bi@intel.com>
Date:   Thu Mar 1 15:08:01 2018 +0800

    MdeModulePkg: Fix incorrect commit introduced by commit SHA-1:052c98
    
    The default value of PcdExtFpdtBootRecordPadSize is 0x20000
    But the following commit in master update it to 0 by mistake.
    SHA-1: 052c98ce246a1ffb0b4c5185a644aa9f902650f7
    Subject: MdeModulePkg: Add ResetSystemPei PEIM
    
    This patch is to restore the value.
    
    Cc: Liming Gao <liming.gao@intel.com>
    Cc: Star Zeng <star.zeng@intel.com>
    Cc: Ruiyu Ni <ruiyu.ni@intel.com>
    Contributed-under: TianoCore Contribution Agreement 1.1
    Signed-off-by: Dandan Bi <dandan.bi@intel.com>
    Reviewed-by: Liming Gao <liming.gao@intel.com>
    Reviewed-by: Star Zeng <star.zeng@intel.com>

commit c9f02a96d8a48844e7168e7572b8a1382c2bfd29
Author: Dandan Bi <dandan.bi@intel.com>
Date:   Thu Mar 1 13:40:48 2018 +0800

    MdeModulePkg/DxeCorePerfLib: Add status check instead of ASSERT
    
    Currently DxeCorePerformanceLib will get SMM performance data based
    on SMM communication handler. If SMM communication handler returns error,
    the library will ASSERT. In fact, if SMM perf data is not found.
    DXE perf data can still be dumped. So using status check instead of
    ASSERT is better.
    
    Cc: Liming Gao <liming.gao@intel.com>
    Cc: Star Zeng <star.zeng@intel.com>
    Contributed-under: TianoCore Contribution Agreement 1.1
    Signed-off-by: Dandan Bi <dandan.bi@intel.com>
    Reviewed-by: Liming Gao <liming.gao@intel.com>

commit a7119c81528072b13e9664ce51f70b8f91f4d9e2
Author: Ruiyu Ni <ruiyu.ni@intel.com>
Date:   Thu Mar 1 14:33:43 2018 +0800

    MdeModulePkg/DebugLibReportStatusCode: Fix hang if format is too long
    
    The previous commit 137ed15511e2045a7333e33ae7f1e873ce1961dd
    * MdeModulePkg/DebugLib: Print partial when format string is too long
    copies partial format string to DEBUG_INFO buffer but when parsing
    the format modifier, the original format string is still used.
    
    The patch fixes this issue.
    
    Contributed-under: TianoCore Contribution Agreement 1.1
    Signed-off-by: Ruiyu Ni <ruiyu.ni@intel.com>
    Reviewed-by: Liming Gao <liming.gao@intel.com>

commit 79f84eb676982fd35e6089060f247c5e38d691dd
Author: Jiaxin Wu <jiaxin.wu@intel.com>
Date:   Tue Feb 27 11:11:46 2018 +0800

    NetworkPkg/HttpDxe: Support HTTP Delete Method.
    
    Per the request to support HttpMethodDelete:
    https://bugzilla.tianocore.org/show_bug.cgi?id=879,
    This patch is to enable the HTTP Delete Method.
    
    Cc: Karunakar P <karunakarp@amiindia.co.in>
    Cc: Ye Ting <ting.ye@intel.com>
    Cc: Fu Siyuan <siyuan.fu@intel.com>
    Contributed-under: TianoCore Contribution Agreement 1.0
    Signed-off-by: Wu Jiaxin <jiaxin.wu@intel.com>
    Reviewed-by: Fu Siyuan <siyuan.fu@intel.com>

commit db79f8019de5e6add3a721b60283586558f5e848
Author: Jiaxin Wu <jiaxin.wu@intel.com>
Date:   Thu Mar 1 17:24:20 2018 +0800

    NetworkPkg/Udp6Dxe: Fix the failure to leave one multicast group address.
    
    The issue was enrolled by the commit of ceec3638. One of the change in the commit
    was to return the status from NetMapIterate in Udp6Groups function. But it should
    not return EFI_ABORTED directly in case McastIp is not NULL, which means to terminate
    the iteration and leave the McastIp successfully.
    
    Cc: Wang Fan <fan.wang@intel.com>
    Cc: Fu Siyuan <siyuan.fu@intel.com>
    Cc: Ye Ting <ting.ye@intel.com>
    Contributed-under: TianoCore Contribution Agreement 1.0
    Signed-off-by: Jiaxin Wu <jiaxin.wu@intel.com>
    Reviewed-by: Fu Siyuan <siyuan.fu@intel.com>

commit f33d39949b3eb7f7ab3f326c8adf560aabc6fd53
Author: Jiaxin Wu <jiaxin.wu@intel.com>
Date:   Thu Mar 1 12:59:57 2018 +0800

    NetworkPkg/HttpBootDxe: Fix the incorrect error message output.
    
    For IPv6 case, if one invalid URL returned from DHCP server, HttpBootDxe
    driver could not retrieve the URL host address from DNS server. In such a
    case, the error message should be printed as:
      Error: Could not retrieve the host address from DNS server.
    Instead of:
      Error: Could not discover the boot information for DHCP server.
    Then, we can still output as following:
      Error: Could not retrieve NBP file size from HTTP server.
    
    Besides, currently implementation in HttpBootLoadFile will always output
    error message even the HTTP process is correct.
    
    This patch is to fix above issue.
    
    Cc: Ye Ting <ting.ye@intel.com>
    Cc: Fu Siyuan <siyuan.fu@intel.com>
    Contributed-under: TianoCore Contribution Agreement 1.0
    Signed-off-by: Wu Jiaxin <jiaxin.wu@intel.com>
    Reviewed-by: Fu Siyuan <siyuan.fu@intel.com>
    Reviewed-by: Ye Ting <ting.ye@intel.com>

commit 951c6e63f8dbcf9eb4c720cf218cb7ede7a7255e
Author: Jiaxin Wu <jiaxin.wu@intel.com>
Date:   Thu Mar 1 11:52:28 2018 +0800

    NetworkPkg/HttpBootDxe: Correct the parameter check for the usage of HttpBootGetFileFromCache.
    
    The patch is to fix the incorrect parameter check for the HttpBootGetFileFromCache().
    
    Cc: Ye Ting <ting.ye@intel.com>
    Cc: Fu Siyuan <siyuan.fu@intel.com>
    Contributed-under: TianoCore Contribution Agreement 1.0
    Signed-off-by: Wu Jiaxin <jiaxin.wu@intel.com>
    Reviewed-by: Fu Siyuan <siyuan.fu@intel.com>
    Reviewed-by: Ye Ting <ting.ye@intel.com>

commit 5ac0a5450bb87ccefa9f847d3d5bf579cb13925e
Author: Feng, YunhuaX </o=Intel/ou=Exchange Administrative Group (FYDIBOHF23SPDLT)/cn=Recipients/cn=Feng, YunhuaX4e1>
Date:   Thu Mar 1 16:22:08 2018 +0800

    BaseTools: report error if flag in LABEL() invalid
    
    Flag in LABEL() is not valid C variable name, will report error.
    
    Cc: Liming Gao <liming.gao@intel.com>
    Cc: Yonghong Zhu <yonghong.zhu@intel.com>
    Contributed-under: TianoCore Contribution Agreement 1.1
    Signed-off-by: Yunhua Feng <yunhuax.feng@intel.com>
    Reviewed-by: Yonghong Zhu <yonghong.zhu@intel.com>

commit 6ee9c68912324b4053cfa15fd06b02af1c1c74d9
Author: Yonghong Zhu <yonghong.zhu@intel.com>
Date:   Thu Mar 1 13:48:31 2018 +0800

    BaseTools: Fix the bug for display incorrect *M flag in report
    
    The root cause is the byte array value in the driver Pcd, some bytes
    have additional space character, while the value in DSC file doesn't
    have this space, it cause the string compare return false, so we remove
    the extra space.
    
    Contributed-under: TianoCore Contribution Agreement 1.1
    Signed-off-by: Yonghong Zhu <yonghong.zhu@intel.com>
    Reviewed-by: Liming Gao <liming.gao@intel.com>

commit 4faf13222edead307109bf8c747200ea3fb617c0
Author: Feng, YunhuaX </o=Intel/ou=Exchange Administrative Group (FYDIBOHF23SPDLT)/cn=Recipients/cn=Feng, YunhuaX4e1>
Date:   Thu Mar 1 10:16:07 2018 +0800

    BaseTools: Fix eval parse string issue
    
    eval argument start with " or ', but it is unicode string,
    will encounter error:
        List = list(eval(Value)) # translate escape character
      File "<string>", line 1
        'j??=????????F??
                 ^
    SyntaxError: EOL while scanning string literal
    
    Cc: Liming Gao <liming.gao@intel.com>
    Cc: Yonghong Zhu <yonghong.zhu@intel.com>
    Contributed-under: TianoCore Contribution Agreement 1.1
    Signed-off-by: Yunhua Feng <yunhuax.feng@intel.com>
    Reviewed-by: Yonghong Zhu <yonghong.zhu@intel.com>

commit 3db2823f1e270b191de701e5514968423b305530
Author: Jiewen Yao <jiewen.yao@intel.com>
Date:   Wed Feb 28 09:48:20 2018 +0800

    Maintainers.txt: Add Jiewen to be co-maintainer of SecurityPkg.
    
    Cc: Chao B Zhang <chao.b.zhang@intel.com>
    Contributed-under: TianoCore Contribution Agreement 1.1
    Signed-off-by: Jiewen Yao <jiewen.yao@intel.com>
    Reviewed-by: Chao Zhang <chao.b.zhang@intel.com>

commit 541a3f5882d60d6241a752127acf3ef367c548e4
Author: Feng, YunhuaX </o=Intel/ou=Exchange Administrative Group (FYDIBOHF23SPDLT)/cn=Recipients/cn=Feng, YunhuaX4e1>
Date:   Thu Mar 1 10:23:14 2018 +0800

    BaseTools: GlobalData.gConfDirectory is None when run GenFds
    
    When run GenFds,  GlobalData.gConfDirectory is None, On Linux
    self._ToolChainFamily default Value is "MSFT", and then
    generate the wrong PcdValueInit Makefile
    
    Cc: Liming Gao <liming.gao@intel.com>
    Cc: Yonghong Zhu <yonghong.zhu@intel.com>
    Contributed-under: TianoCore Contribution Agreement 1.1
    Signed-off-by: Yunhua Feng <yunhuax.feng@intel.com>
    Reviewed-by: Yonghong Zhu <yonghong.zhu@intel.com>

commit cd49821608f7eb867b8351c7a0cd3ed4dd2d563d
Author: Yonghong Zhu <yonghong.zhu@intel.com>
Date:   Thu Mar 1 00:07:48 2018 +0800

    BaseTools: Fix the bug for single module build with GenC/GenMake
    
    copy the same logic from _BuildPa() function.
    
    Contributed-under: TianoCore Contribution Agreement 1.1
    Signed-off-by: Yonghong Zhu <yonghong.zhu@intel.com>
    Reviewed-by: Liming Gao <liming.gao@intel.com>

commit 23b53ede358d9262a78e3f7b2a34423382d138a8
Author: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Thu Mar 1 09:27:31 2018 +0000

    ShellPkg/UefiShellDebug1CommandsLib: remove I/O address limit from 'mm'
    
    Neither the EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL nor the EFI_CPU_IO2_PROTOCOL
    impose any restrictions when it comes to the range of valid I/O
    addresses. Even so, the 'mm' command in -IO mode refuses to perform
    accesses to addresses >= 0xffff.
    
    It is not up to 'mm' to impose this restriction, so remove it.
    
    Contributed-under: TianoCore Contribution Agreement 1.1
    Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
    Reviewed-by: Jaben Carsey <jaben.carsey@intel.com>

commit a16f7f47949ebddf07d228ef3827ec8747180e48
Author: Liming Gao <liming.gao@intel.com>
Date:   Wed Feb 28 16:35:59 2018 +0800

    BaseTools: Align WIN_CERTIFICATE_UEFI_GUID definition to MdePkg one.
    
    Contributed-under: TianoCore Contribution Agreement 1.1
    Signed-off-by: Liming Gao <liming.gao@intel.com>
    Reviewed-by: Yonghong Zhu <yonghong.zhu@intel.com>


--===============5274952623085014827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5274952623085014827==--
