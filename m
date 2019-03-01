From: Lars Kurth <lars.kurth@citrix.com>
Subject: [PATCH] Minor security policy text changes to avoid
 ambiguity
Date: Fri,  1 Mar 2019 13:55:41 +0000
Message-ID: <e4407aad1d83751dbc7068b32a3c8d5bc242994c.1551448234.git.lars.kurth@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1349815528654976994=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OeqB=RE=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1gzidu-0006Vx-2B
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2019 13:56:02 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Lars Kurth <lars.kurth@citrix.com>, committers@xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============1349815528654976994==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

See http://xenbits.xen.org/gitweb/?p=people/larsk/governance.git;a=summary
for the repository.

Signed-off-by: Lars Kurth <lars.kurth@citrix.com>
CC: committers@xenproject.org
---
 security-policy.pandoc | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/security-policy.pandoc b/security-policy.pandoc
index 8e07384..74d0d8b 100644
--- a/security-policy.pandoc
+++ b/security-policy.pandoc
@@ -214,8 +214,9 @@ List members are allowed to make available to their users only the following:
 -   The planned disclosure date
 
 List members may, if (and only if) the Security Team grants permission, deploy
-fixed versions during the embargo. Permission for deployment, and any
-restrictions, will be stated in the embargoed advisory text.
+fixed versions to their own public facing service during the embargo. Permission
+for deployment, and any restrictions, will be stated in the embargoed advisory
+text.
 
 The Security Team will normally permit such deployment, even for systems where
 VMs are managed or used by non-members of the predisclosure list. The Security
@@ -232,6 +233,9 @@ information about the issue (as listed above). This applies whether the
 deployment occurs during the embargo (with permission - see above) or is
 planned for after the end of the embargo.
 
+NB: Distribution of updated software is prohibited (except to other members of
+the predisclosure list).
+
 *NOTE:* Prior v2.2 of this policy (25 June 2014) it was permitted to also make
 available the allocated CVE number. This is no longer permitted in accordance
 with MITRE policy.[]()
@@ -408,6 +412,7 @@ Change History {#changelog}
 --------------
 
 <div class="box-note">
+-   **v3.22 March 1st 2019:** Minor policy text clarifications
 -   **v3.21 Nov 19th 2018:** Added XCP-ng.org
 -   **v3.20 June 14th 2018:** Added Star Lab
 -   **v3.19 May 9th 2018:** Remove Google and Xen 3.4 stable tree maintainer
-- 
2.13.0



--===============1349815528654976994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1349815528654976994==--
