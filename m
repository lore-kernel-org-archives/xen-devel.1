From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC v1 10/74] x86/time: Print a more helpful
	error when a platform timer can't be found
Date: Thu, 4 Jan 2018 13:05:21 +0000
Message-ID: <20180104130625.28605-11-wei.liu2@citrix.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/p+y=d7=citrix.com=prvs=535dfbe76=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eX5ZZ-0003oS-Es
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2018 13:28:41 +0000
In-Reply-To: <20180104130625.28605-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClJldmlld2Vk
LWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni90aW1l
LmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni90aW1lLmMgYi94ZW4vYXJjaC94ODYvdGltZS5j
CmluZGV4IDJhODc5NTAyYTIuLjNiNjU0ZDdiN2QgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni90
aW1lLmMKKysrIGIveGVuL2FyY2gveDg2L3RpbWUuYwpAQCAtNzA4LDcgKzcwOCw4IEBAIHN0YXRp
YyB1NjQgX19pbml0IGluaXRfcGxhdGZvcm1fdGltZXIodm9pZCkKICAgICAgICAgfQogICAgIH0K
IAotICAgIEJVR19PTihyYyA8PSAwKTsKKyAgICBpZiAoIHJjIDw9IDAgKQorICAgICAgICBwYW5p
YygiVW5hYmxlIHRvIGZpbmQgdXNhYmxlIHBsYXRmb3JtIHRpbWVyIik7CiAKICAgICBwcmludGso
IlBsYXRmb3JtIHRpbWVyIGlzICVzICVzXG4iLAogICAgICAgICAgICBmcmVxX3N0cmluZyhwdHMt
PmZyZXF1ZW5jeSksIHB0cy0+bmFtZSk7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
