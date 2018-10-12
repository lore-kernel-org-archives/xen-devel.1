From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/HVM: adjust hvm_interrupt_blocked()
Date: Fri, 12 Oct 2018 17:37:36 +0100
Message-ID: <ed21e605-fd60-bdaf-0178-e6b173bd680c@citrix.com>
References: <5BC0C4B602000078001F1258@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zou9=my=citrix.com=prvs=816151957=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gB0Rm-0004Au-PZ
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 16:37:54 +0000
In-Reply-To: <5BC0C4B602000078001F1258@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTAvMTggMTY6NTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEZpcnN0IG9mIGFsbCwgaHZt
X2ludHNyY19tY2Ugd2FzIG5vdCBjb25zaWRlcmVkIGhlcmUgYXQgYWxsLCB5ZXQgbm90aGluZwo+
IGJsb2NrcyAjTUMgKG90aGVyIHRoYW4gYW4gYWxyZWFkeSBpbi1wcm9ncmVzcyAjTUMsIGJ1dCBk
ZWFsaW5nIHdpdGggdGhpcwo+IGlzIG5vdCB0aGUgcHVycG9zZSBvZiB0aGlzIHBhdGNoKS4KCkkg
ZG9uJ3QgYmVsaWV2ZSB3ZSd2ZSBnb3Qgc3VmZmljaWVudCBpbmZyYXN0cnVjdHVyZSB0byBmaXgg
dGhpcwpyZWFzb25hYmx5IHlldCwgYnV0IGZvciB0aGUgcmVjb3JkLCB0aGUgcmVhbCBiZWhhdmlv
dXIgZm9yIE1DRXMgaXM6CgpJZiBpbnRlbArCoMKgwqAgYnJvYWRjYXN0IHRvIGV2ZXJ5IHRocmVh
ZCBjb3ZlcmVkIGJ5IHRoZSBNQ0UgYmFuawplbHNlIGlmIEFNRArCoMKgwqAgc2VudCB0byB0aGUg
dGhyZWFkIHdpdGggdGhlIGxvd2VzdCBpZCBjb3ZlcmVkIGJ5IHRoZSBNQ0UgYmFuawoKV2hlbiB0
cnlpbmcgdG8gaW5qZWN0OgoKaWYgIUNSNC5NQ0Ugb3IgTUNHX1NUQVRVUy5NQ0lQCsKgwqDCoCBz
aHV0ZG93bgoKRnVydGhlcm1vcmUsIEkgYmVsaWV2ZSBldmVuICNNQyBpcyBibG9ja2VkIGJ5IHRo
ZSBNT1ZTUyBzaGFkb3csIGJlY2F1c2UKdGhlIHB1cnBvc2Ugb2YgdGhlIHNoYWRvdyBpcyB0byBp
bmRpY2F0ZSAibXkgc3RhY2sgaXMgbm90IHNhZmUgdG8gdGFrZQphbiBleGNlcHRpb24iLgoKPiBB
ZGRpdGlvbmFsbHkgU1RJLXNoYWRvdyBvbmx5IGJsb2NrcyBtYXNrYWJsZSBpbnRlcnJ1cHRzLCBi
dXQgbm90IE5NSS4KClRoaXMgaGFzIGJlZW4gZGlzY3Vzc2VkIG9uIExLTUwgaW4gdGhlIHBhc3Qs
IGJ1dCBgU1RJOyBITFRgIHdpbGwKZGVhZGxvY2sgaWYgTk1JcyBkb24ndCByZXNwZWN0IHRoZSBT
VEkgc2hhZG93LgoKQW4gTk1JIHdoaWNoIGhpdHMgdGhhdCBpbnN0cnVjdGlvbiBib3VuZGFyeSB3
aWxsIElSRVQgd2l0aCBJRiBjbGVhciwgYXQKd2hpY2ggcG9pbnQgdGhlIGNvcmUgd2lsbCBoYWx0
IGFuZCBuZXZlciB3YWtlIHVwLgoKSSBiZWxpZXZlIHRoZSBpbnB1dCBmcm9tIHRoZSB2ZW5kb3Ig
YXJjaGl0ZWN0cyB3YXMgdGhhdCBzb21lIHZlcnkgb2xkCmNvcmVzIHN1ZmZlciBmcm9tIHRoaXMg
cHJvYmxlbSwgYnV0IGFueXRoaW5nIHlvdSBjYW4gZ2V0IHlvdXJzIGhhbmQgb24KdG9kYXkgd2ls
bCByZXNwZWN0IHRoZSBTVEkgc2hhZG93LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
