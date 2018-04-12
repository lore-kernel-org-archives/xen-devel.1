From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 1/5] docs/parse-support-md: internals: Introduce
 docref_a
Date: Thu, 12 Apr 2018 19:26:39 +0100
Message-ID: <1523557603-22218-2-git-send-email-ian.jackson@eu.citrix.com>
References: <1523557603-22218-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9+jx=hb=citrix.com=prvs=633689d9b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f6gwG-00066x-Ns
 for xen-devel@lists.xenproject.org; Thu, 12 Apr 2018 18:27:16 +0000
In-Reply-To: <1523557603-22218-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8SWFuLkph
Y2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBkb2NzL3BhcnNlLXN1cHBvcnQtbWQgfCAxMCArKysr
KysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RvY3MvcGFyc2Utc3VwcG9ydC1tZCBiL2RvY3MvcGFyc2Utc3VwcG9ydC1t
ZAppbmRleCBkZWNkYTMzLi41YmY4NDA1IDEwMDc1NQotLS0gYS9kb2NzL3BhcnNlLXN1cHBvcnQt
bWQKKysrIGIvZG9jcy9wYXJzZS1zdXBwb3J0LW1kCkBAIC0zMTgsNiArMzE4LDEyIEBAIHN1YiBv
IHsgcHJpbnQgQF8gb3IgZGllICQhOyB9CiAKIG91ciBAcGVuZGluZ19oZWFkaW5nczsKIAorc3Vi
IGRvY3JlZl9hICgkJCkgeworICAgIG15ICgkaSwgJHJlYWxzZWN0KSA9IEBfOworICAgIHJldHVy
biBzcHJpbnRmICc8YSBocmVmPSIlcyMlcyI+JywKKyAgICAgICAgJHZlcnNpb25fdXJsc1skaV0s
ICRyZWFsc2VjdC0+e0FuY2hvcn07Cit9CisKIHN1YiB3cml0ZV9vdXRwdXRfcm93ICgkKSB7CiAg
ICAgbXkgKCRzZWN0bm9kZSkgPSBAXzsKICMgICAgcHJpbnQgU1RERVJSICdXT1IgJywgRHVtcGVy
KCRkLCAkc2VjdG5vZGUpOwpAQCAtMzY0LDggKzM3MCw4IEBAIHN1YiB3cml0ZV9vdXRwdXRfcm93
ICgkKSB7CiAgICAgICAgICAgICAgICAgJiYgJHNlY3Rub2RlLT57UmVhbFNlY3R9e0FuY2hvcn0p
IHsKICAgICAgICAgICAgICAgICBteSAkcm93cyA9ICRzZWN0bm9kZS0+e1JlYWxTZWN0fXtSb3dz
fTsKICAgICAgICAgICAgICAgICAkbmV4dGNlbGwgPSBzcHJpbnRmICc8dGQgcm93c3Bhbj0lZD4n
LCAkcm93czsKLSAgICAgICAgICAgICAgICAkbmV4dGNlbGwgLj0gc3ByaW50ZiAnPGEgaHJlZj0i
JXMjJXMiPlsqXTwvYT4nLAotICAgICAgICAgICAgICAgICAgICAkdmVyc2lvbl91cmxzWyRpXSwg
JHNlY3Rub2RlLT57UmVhbFNlY3R9e0FuY2hvcn07CisgICAgICAgICAgICAgICAgJG5leHRjZWxs
IC49IGRvY3JlZl9hICRpLCAkc2VjdG5vZGUtPntSZWFsU2VjdH07CisgICAgICAgICAgICAgICAg
JG5leHRjZWxsIC49ICdbKl08L2E+JzsKICAgICAgICAgICAgICAgICAkbmV4dGNlbGwgLj0gJzwv
dGQ+JzsKICAgICAgICAgICAgICAgICAkY29sc3BhbiA9ICcnOwogICAgICAgICAgICAgfQotLSAK
Mi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
