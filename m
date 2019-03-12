From: "Hawrylko, Lukasz" <lukasz.hawrylko@intel.com>
Subject: [PATCH 0/1] Update TXT maintainter
Date: Tue, 12 Mar 2019 09:39:25 +0000
Message-ID: <cover.1552379750.git.lukasz.hawrylko@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4tes=RP=intel.com=lukasz.hawrylko@srs-us1.protection.inumbo.net>)
 id 1h3dsg-0007QK-Ii
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 09:39:30 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>, "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>, "jbeulich@suse.com" <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

RHVlIHRvIHBlcnNvbmFsIGNoYW5nZXMgYXQgSW50ZWwsIEkgYW0gbmV3IFRYVCBtYWludGFpbmVy
IGZvciBYRU4uCkFkZGluZyBwYXRjaCB0aGF0IHVwZGF0ZXMgbWFpbnRhaW5lcnMgbGlzdC4KCkx1
a2FzeiBIYXdyeWxrbyAoMSk6CiAgVXBkYXRlIFRYVCBtYWludGFpbnRlcgoKIE1BSU5UQUlORVJT
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgot
LSAKMi4yMC4xCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKSW50ZWwgVGVjaG5vbG9neSBQb2xhbmQgc3AuIHogby5v
Lgp1bC4gU2xvd2Fja2llZ28gMTczIHwgODAtMjk4IEdkYW5zayB8IFNhZCBSZWpvbm93eSBHZGFu
c2sgUG9sbm9jIHwgVklJIFd5ZHppYWwgR29zcG9kYXJjenkgS3Jham93ZWdvIFJlamVzdHJ1IFNh
ZG93ZWdvIC0gS1JTIDEwMTg4MiB8IE5JUCA5NTctMDctNTItMzE2IHwgS2FwaXRhbCB6YWtsYWRv
d3kgMjAwLjAwMCBQTE4uCgpUYSB3aWFkb21vc2Mgd3JheiB6IHphbGFjem5pa2FtaSBqZXN0IHBy
emV6bmFjem9uYSBkbGEgb2tyZXNsb25lZ28gYWRyZXNhdGEgaSBtb3plIHphd2llcmFjIGluZm9y
bWFjamUgcG91Zm5lLiBXIHJhemllIHByenlwYWRrb3dlZ28gb3RyenltYW5pYSB0ZWogd2lhZG9t
b3NjaSwgcHJvc2lteSBvIHBvd2lhZG9taWVuaWUgbmFkYXdjeSBvcmF6IHRyd2FsZSBqZWogdXN1
bmllY2llOyBqYWtpZWtvbHdpZWsKcHJ6ZWdsYWRhbmllIGx1YiByb3pwb3dzemVjaG5pYW5pZSBq
ZXN0IHphYnJvbmlvbmUuClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRh
aW4gY29uZmlkZW50aWFsIG1hdGVyaWFsIGZvciB0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVuZGVk
IHJlY2lwaWVudChzKS4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxl
YXNlIGNvbnRhY3QgdGhlIHNlbmRlciBhbmQgZGVsZXRlIGFsbCBjb3BpZXM7IGFueSByZXZpZXcg
b3IgZGlzdHJpYnV0aW9uIGJ5Cm90aGVycyBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
