From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 04/11] docs/gen-html-index: Extract titles from
 HTML documents
Date: Thu, 12 Apr 2018 13:28:29 +0100
Message-ID: <1523536116-31316-5-git-send-email-ian.jackson@eu.citrix.com>
References: <1523536116-31316-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9+jx=hb=citrix.com=prvs=633689d9b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f6bLM-0006Np-BM
 for xen-devel@lists.xenproject.org; Thu, 12 Apr 2018 12:28:48 +0000
In-Reply-To: <1523536116-31316-1-git-send-email-ian.jackson@eu.citrix.com>
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
bGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQWNrZWQtYnk6
IExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4KLS0tCiBkb2NzL2dlbi1odG1sLWlu
ZGV4IHwgMTMgKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kb2NzL2dlbi1odG1sLWluZGV4IGIvZG9jcy9nZW4taHRtbC1pbmRleApp
bmRleCBlOTc5MmJmLi41YjQzYjQyIDEwMDY0NAotLS0gYS9kb2NzL2dlbi1odG1sLWluZGV4Cisr
KyBiL2RvY3MvZ2VuLWh0bWwtaW5kZXgKQEAgLTEwLDYgKzEwLDcgQEAgdXNlIHdhcm5pbmdzOwog
dXNlIEdldG9wdDo6TG9uZzsKIHVzZSBJTzo6RmlsZTsKIHVzZSBGaWxlOjpCYXNlbmFtZTsKK3Vz
ZSBIVE1MOjpUcmVlQnVpbGRlcjo6WFBhdGg7CiAKIEdldG9wdDo6TG9uZzo6Q29uZmlndXJlKCdi
dW5kbGluZycpOwogCkBAIC02NCw2ICs2NSwxOCBAQCBzdWIgbWFrZV9saW5rdGV4dCAoJCkgewog
ICAgIHJldHVybiAiJDEoJDIpIiBpZiAkbCA9fiBtLF5tYW4vKC4qKVwuKFswLTldLiopXC5odG1s
LDsKICAgICAkbCA9fiBzLy4oPzpodG1sfHR4dCkkLy9nOwogICAgIHJldHVybiAkaW5kZXh7JGx9
IGlmIGV4aXN0cyAkaW5kZXh7JGx9OworCisgICAgbXkgJGZyb21faHRtbDsKKyAgICBldmFsIHsK
KyAgICAgICAgbXkgJHRyZWUgPSBuZXcgSFRNTDo6VHJlZUJ1aWxkZXI6OlhQYXRoOworICAgICAg
ICBteSAkZiA9ICIkb3V0ZGlyLyRsLmh0bWwiOworICAgICAgICBvcGVuIEYsICc8JywgJGYgb3Ig
ZGllICIkbCAkZiAkISI7CisgICAgICAgICR0cmVlLT5wYXJzZV9maWxlKFwqRikgb3IgZGllOwor
ICAgICAgICBjbG9zZSBGOworICAgICAgICAkZnJvbV9odG1sID0gJHRyZWUtPmZpbmR2YWx1ZSgi
L2h0bWwvaGVhZC90aXRsZSIpOworICAgIH07CisgICAgcmV0dXJuICRmcm9tX2h0bWwgaWYgJGZy
b21faHRtbDsKKwogICAgIHJldHVybiBiYXNlbmFtZSgkbCk7CiB9CiAKLS0gCjIuMS40CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
