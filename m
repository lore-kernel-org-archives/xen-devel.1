From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v4 6/6] x86/microcode: Synchronize late
 microcode loading
Date: Fri, 30 Nov 2018 11:49:14 -0500
Message-ID: <f8931bc8-4f45-2526-9d2b-b4d668834750@oracle.com>
References: <1543383256-12371-1-git-send-email-chao.gao@intel.com>
 <1543383256-12371-7-git-send-email-chao.gao@intel.com>
 <20181128152209.hqpgqtuy2mx7ytk6@mac> <20181129044325.GD23701@gao-cwp>
 <20181129095653.d2jwozb7xbuq6cq2@mac>
 <d02e8e5a-369a-6509-94f4-6e0e1872b118@oracle.com>
 <5C0106FB020000780020182A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xftc=oj=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gSlwf-0008Gt-9W
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 16:47:13 +0000
In-Reply-To: <5C0106FB020000780020182A@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Borislav Petkov <bp@suse.de>, Wei Liu <wei.liu2@citrix.com>, Ashok Raj <ashok.raj@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, tglx@linutronix.de, Roger Pau Monne <roger.pau@citrix.com>, Chao Gao <chao.gao@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMzAvMTggNDo0NiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjkuMTEuMTgg
YXQgMjM6NDMsIDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4gd3JvdGU6Cj4+IE9uZSBvdGhl
ciBjb21tZW50IGFib3V0IHRoaXMgcGF0Y2ggKHdoaWNoIElJUkMgd2FzIHJhaXNlZCBieSBBbmRy
ZXcgb24KPj4gYW4gZWFybGllciB2ZXJzaW9uKSBpcyB0aGF0IGl0IG1heSBiZSB3b3J0aCB0byBz
dG9wIHRpbWVyIGNhbGlicmF0aW9uLiBJCj4+IGFtIHByZXR0eSBzdXJlIHdlJ3ZlIHNlZW4gZGVh
ZGxvY2tzLCB3aGljaCBpcyB3aHkgd2UgZW5kZWQgdXAgZGlzYWJsaW5nCj4+IGl0IGR1cmluZyBt
aWNyb2NvZGUgdXBkYXRlcy4KPiBJIHJlY2FsbCB0aGUgY2xhaW0sIGJ1dCBJIGRvbid0IHRoaW5r
IEkndmUgZXZlciBzZWVuIHByb29mLiAKCkkgY2FuJ3QgcHJvdmlkZSBwcm9vZiBhdCB0aGlzIHBv
aW50LCBvbmx5IHNvbWV3aGF0IHZhZ3VlIG1lbW9yeSBvZgpzZWVpbmcgY2FsaWJyYXRpb24gY29k
ZSBpbiB0aGUgc3RhY2sgZHVtcC4KCj4gTXkgcG9pbnQgd2FzCj4gYW5zIHN0aWxsIGlzIHRoYXQg
aWYgdGhlcmUncyBhIHByb2JsZW0gd2l0aCB1Y29kZSBsb2FkaW5nIHVzaW5nIHRoZQo+IHN0b3At
bWFjaGluZSBsb2dpYyBoZXJlLCB0aGVuIHRoZXJlJ3MgYSBwcm9ibGVtIHdpdGggdGhlIHN0b3At
bWFjaGluZQo+IGxvZ2ljIGluIGdlbmVyYWwsIHdoaWNoIHdvdWxkIG1ha2Ugb3RoZXIgdXNlcywg
cGVyaGFwcyBtb3N0IG5vdGFibHkKPiByY3VfYmFycmllcigpLCB1bnNhZmUgdG9vLiAKClBvc3Np
Ymx5LgoKcmN1X2JhcnJpZXIoKSBhcHBlYXJzIHRvIGJlIG9ubHkgdXNlZCBpbiBjcHUgaG90cGx1
ZyBjb2RlIGFuZCBwb3dlcgptYW5hZ2VtZW50LCBhbmQgSSBkb24ndCBrbm93IHdoZXRoZXIgZWl0
aGVyIGhhcyBiZWVuIHRlc3RlZCB1bmRlciBzdHJlc3MuCgpJbiBvdXIgY2FzZSBpdCB3b3VsZCB0
YWtlIG11bHRpcGxlIG1pY3JvY29kZSB1cGRhdGVzIG9uIHJlbGF0aXZlbHkgbGFyZ2UKKH4xMDAg
Y3B1cykgc3lzdGVtcyBiZWZvcmUgd2UnZCBoaXQgdGhlIGRlYWRsb2NrLgoKCj4gT3RvaCBmcm9t
IHlvdXIgcmVwbHkgaXQncyBub3QgY2xlYXIgd2hldGhlcgo+IHRoZSBvYnNlcnZlZCBpc3N1ZSB3
YXNuJ3Qgd2l0aCBvdXIgcHJlc2VudCB3YXkgb2YgbG9hZGluZyB1Y29kZSwKPiBidXQgdGhlbiBp
dCB3b3VsZCBwdXQgdW5kZXIgcXVlc3Rpb24gdGhlIGdlbmVyYWwgY29ycmVjdG5lc3Mgb2YKPiBj
b250aW51ZV9oeXBlcmNhbGxfb25fY3B1KCksIHdoaWNoIGFnYWluIHdlIHVzZSBmb3IgbW9yZSB0
aGFuIGp1c3QKPiB1Y29kZSBsb2FkaW5nLgoKSXQgd2FzIHdpdGggYSB2YXJpYXRpb24gb2YgdGhp
cyBuZXcgY29kZSwgbm90IHdpdGggd2hhdCdzIGN1cnJlbnRseSBpbgp0aGUgdHJlZS4KCi1ib3Jp
cwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
