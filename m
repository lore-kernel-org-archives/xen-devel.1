From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 4/9] docs/gen-html-index: Extract titles from
 HTML documents
Date: Wed, 11 Apr 2018 16:35:34 +0100
Message-ID: <1523460939-15013-5-git-send-email-ian.jackson@eu.citrix.com>
References: <1523460939-15013-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=97mu=ha=citrix.com=prvs=63276c6f0=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f6Hq7-0002ku-AL
 for xen-devel@lists.xenproject.org; Wed, 11 Apr 2018 15:39:15 +0000
In-Reply-To: <1523460939-15013-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+ClJl
bGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiBkb2Nz
L2dlbi1odG1sLWluZGV4IHwgMTMgKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEzIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kb2NzL2dlbi1odG1sLWluZGV4IGIvZG9jcy9nZW4t
aHRtbC1pbmRleAppbmRleCBlOTc5MmJmLi41YjQzYjQyIDEwMDY0NAotLS0gYS9kb2NzL2dlbi1o
dG1sLWluZGV4CisrKyBiL2RvY3MvZ2VuLWh0bWwtaW5kZXgKQEAgLTEwLDYgKzEwLDcgQEAgdXNl
IHdhcm5pbmdzOwogdXNlIEdldG9wdDo6TG9uZzsKIHVzZSBJTzo6RmlsZTsKIHVzZSBGaWxlOjpC
YXNlbmFtZTsKK3VzZSBIVE1MOjpUcmVlQnVpbGRlcjo6WFBhdGg7CiAKIEdldG9wdDo6TG9uZzo6
Q29uZmlndXJlKCdidW5kbGluZycpOwogCkBAIC02NCw2ICs2NSwxOCBAQCBzdWIgbWFrZV9saW5r
dGV4dCAoJCkgewogICAgIHJldHVybiAiJDEoJDIpIiBpZiAkbCA9fiBtLF5tYW4vKC4qKVwuKFsw
LTldLiopXC5odG1sLDsKICAgICAkbCA9fiBzLy4oPzpodG1sfHR4dCkkLy9nOwogICAgIHJldHVy
biAkaW5kZXh7JGx9IGlmIGV4aXN0cyAkaW5kZXh7JGx9OworCisgICAgbXkgJGZyb21faHRtbDsK
KyAgICBldmFsIHsKKyAgICAgICAgbXkgJHRyZWUgPSBuZXcgSFRNTDo6VHJlZUJ1aWxkZXI6OlhQ
YXRoOworICAgICAgICBteSAkZiA9ICIkb3V0ZGlyLyRsLmh0bWwiOworICAgICAgICBvcGVuIEYs
ICc8JywgJGYgb3IgZGllICIkbCAkZiAkISI7CisgICAgICAgICR0cmVlLT5wYXJzZV9maWxlKFwq
Rikgb3IgZGllOworICAgICAgICBjbG9zZSBGOworICAgICAgICAkZnJvbV9odG1sID0gJHRyZWUt
PmZpbmR2YWx1ZSgiL2h0bWwvaGVhZC90aXRsZSIpOworICAgIH07CisgICAgcmV0dXJuICRmcm9t
X2h0bWwgaWYgJGZyb21faHRtbDsKKwogICAgIHJldHVybiBiYXNlbmFtZSgkbCk7CiB9CiAKLS0g
CjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
