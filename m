From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v3] x86/AMD: flush TLB after ucode update
Date: Mon, 28 Jan 2019 02:51:31 -0700
Message-ID: <5C4ED0A302000078002119D5@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ayfn=QE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1go3Zq-0008Nd-PK
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 09:51:38 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGluY3JlYXNlZCBudW1iZXIgb2YgbWVzc2FnZXMgKHNwZWNfY3RybC5jOnByaW50X2RldGFp
bHMoKSkgd2l0aGluIGEKY2VydGFpbiB0aW1lIHdpbmRvdyBtYWRlIG1lIG5vdGljZSBzb21lIHNs
b3duZXNzIG9mIGJvb3QgdGltZSBzY3JlZW4Kb3V0cHV0LiBFeHBlcmltZW50YWxseSBJJ3ZlIG5h
cnJvd2VkIHRoZSB0aW1lIHdpbmRvdyB0byBiZSBmcm9tCmltbWVkaWF0ZWx5IGFmdGVyIHRoZSBl
YXJseSB1Y29kZSB1cGRhdGUgb24gdGhlIEJTUCB0byB0aGUgUEFUIHdyaXRlIGluCmNwdV9pbml0
KCksIHdoaWNoIHVwb24gZnVydGhlciBpbnZlc3RpZ2F0aW9uIGhhcyBhbiBlZmZlY3QgYmVjYXVz
ZSBvZgp0aGUgZnVsbCBUTEIgZmx1c2ggdGhhdCdzIGltcGxpZWQgYnkgdGhhdCB3cml0ZS4KCkZv
ciB0aGF0IHJlYXNvbiwgYXMgYSB3b3JrYXJvdW5kLCBmbHVzaCB0aGUgVExCIG9mIHRoZSBtYXBw
aW5nIG9mIHRoZQpwYWdlIHRoYXQgaG9sZHMgdGhlIGJsb2IuIE5vdGUgdGhhdCBmbHVzaGluZyBq
dXN0IGEgc2luZ2xlIHBhZ2UgaXMKc3VmZmljaWVudDogQXMgcGVyIHZlcmlmeV9wYXRjaF9zaXpl
KCkgcGF0Y2ggc2l6ZSBjYW4ndCBleGNlZWQgNGssIGFuZAp0aGUgd2F5IHhtYWxsb2MoKSB3b3Jr
cyB0aGUgYmxvYiBjYW4ndCBiZSBjcm9zc2luZyBhIHBhZ2UgYm91bmRhcnkuCgpTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQp2MzogVXNlIFRMQiBmbHVz
aCBpbnN0ZWFkIG9mIFBBVCB3cml0ZS4KdjI6IFJlLWJhc2UuCgotLS0gYS94ZW4vYXJjaC94ODYv
bWljcm9jb2RlX2FtZC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfYW1kLmMKQEAgLTIx
OCw2ICsyMTgsMTIgQEAgc3RhdGljIGludCBhcHBseV9taWNyb2NvZGUodW5zaWduZWQgaW50CiAK
ICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZtaWNyb2NvZGVfdXBkYXRlX2xvY2ssIGZsYWdz
KTsKIAorICAgIC8qCisgICAgICogRXhwZXJpbWVudGFsbHkgdGhpcyBoZWxwcyB3aXRoIHBlcmZv
cm1hbmNlIGlzc3VlcyBvbiBhdCBsZWFzdCBjZXJ0YWluCisgICAgICogRmFtMTUgbW9kZWxzLgor
ICAgICAqLworICAgIGZsdXNoX2FyZWFfbG9jYWwoaGRyLCBGTFVTSF9UTEJfR0xPQkFMIHwgRkxV
U0hfT1JERVIoMCkpOworCiAgICAgLyogY2hlY2sgY3VycmVudCBwYXRjaCBpZCBhbmQgcGF0Y2gn
cyBpZCBmb3IgbWF0Y2ggKi8KICAgICBpZiAoIGh3X2VyciB8fCAocmV2ICE9IGhkci0+cGF0Y2hf
aWQpICkKICAgICB7CgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
