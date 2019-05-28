From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [ANNOUNCE] Xen 4.13 Development Update
Date: Wed, 29 May 2019 00:07:42 +0100
Message-ID: <89f4a2db-46bd-c039-af05-708ef6077abf@citrix.com>
References: <20190528105457.2305-1-jgross@suse.com>
 <CABfawhnMVFrpwc8tc_cPtCFD+he6X79PZZ-LtHQ0d0Jcwv58LA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qGVJ=T4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hVlCB-0008IB-C8
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 23:07:51 +0000
In-Reply-To: <CABfawhnMVFrpwc8tc_cPtCFD+he6X79PZZ-LtHQ0d0Jcwv58LA@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDUvMjAxOSAxNDo0NCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+PiAqICBJbXByb3Zl
bWVudHMgdG8gZG9tYWluIGNyZWF0aW9uICh2MikKPj4gICAtICBBbmRyZXcgQ29vcGVyCj4gSGkg
QW5kcmV3LAo+IGNvdWxkIHlvdSBwb2ludCBtZSB0byBhIGdpdCBicmFuY2ggd2hlcmUgeW91IGhh
dmUgdGhpcyB3b3JrPyBJJ20KPiBleHBlcmltZW50aW5nIHdpdGggc29tZSBzdHVmZiBhbmQgd291
bGQgbGlrZSB0byBzZWUgd2hhdCB5b3VyIHdvcmsgaW4KPiB0aGlzIGFyZWEgdG91Y2hlcy4KClRo
ZXJlIGlzIGVzc2VudGlhbGx5IG5vdGhpbmcgd2hpY2ggaXNuJ3QgYWxyZWFkeSBpbiBzdGFnaW5n
LsKgIFN1ZmZpY2UgaXQKdG8gc2F5IHRoYXQgTURTIGdvdCBpbiB0aGUgd2F5IG9mIGNvbnRpbnVp
bmcgdGhhdCB3b3JrLgoKVGhlIG5leHQgdGFzayBvbiB0aGUgbGlzdCBpcyB0byBtYWtlIHRoZSB2
Y3B1L2RvbWFpbiBkZXN0cm95IHBhdGhzCmlkZW1wb3RlbnQsIHRoZW4gcmVpbXBsZW1lbnQgdGhl
IGNyZWF0ZSBwYXRocyBieSBqdXN0IHJldHVybmluZyBvdXQgb2YKdGhlIHRvcCBvZiB0aGUgY2Fs
bCB0cmVlIHdpdGggYW4gZXJyb3IsIGFuZCBoYXZpbmcgdGhlIHRvcCBsZXZlbCBjYWxsCmRlc3Ry
b3kuwqAgVGhpcyBhdm9pZHMgaGF2aW5nIHR3byBkaWZmZXJlbnQgc2V0cyBvZiBkZXN0cnVjdGlv
biBsb2dpYwp3aGljaCBhcmVuJ3QgcXVpdGUgaWRlbnRpY2FsLgoKV2l0aCB0aGF0IGluIHBsYWNl
LCBJIGNhbiBtb3ZlIHRoZSB2Y3B1IGFsbG9jYXRpb24gbG9vcCBpbnRvCmRvbWFpbl9jcmVhdGUo
KSBhZnRlciB3aGljaCBpdCB3aWxsIGJlIGltcG9zc2libGUgdG8gZmluZCBhIGRvbWFpbiBieSBJ
RAphbmQgdHJpcCBvdmVyIHNvbWUgTlVMTCB2Y3B1IHBvaW50ZXJzLgoKSWYgeW91IGFyZSBpbnRy
b2R1Y2luZyBvciBhZGp1c3RpbmcgYWxsb2NhdGlvbi9kZWFsbG9jYXRpb24gbG9naWMsCnBsZWFz
ZSBtYWtlIHRoZSBkZWFsbG9jYXRpb24gaWRlbXBvdGVudCwgYW5kIGlkZWFsbHkgdXNlIHRoZSBk
ZWFsbG9jYXRlCmZ1bmN0aW9uIHRvIGNsZWFuIHVwIGZyb20gYSBmYWlsZWQgYWxsb2NhdGUuwqAg
VGhlcmUgd2lsbCBiZSBzb21lCnRyZWUtd2lkZSByZWZhY3RvcmluZyBhdCBzb21lIHBvaW50IGlu
IHRoZSBmdXR1cmUgd2hpY2ggbW92ZXMgZXZlcnl0aGluZwppbnRvIHBsYWNlLsKgIFVudGlsIHRo
ZW4sIGhhdmUgYXQgaXQuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
