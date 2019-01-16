From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 4/4] xen/x86: Allow stubdom access to irq
 created for msi.
Date: Wed, 16 Jan 2019 14:07:02 +0100
Message-ID: <20190116130702.3yqqpdlkbg5ju275@mac>
References: <cover.f56cb3033143af6e9a0aeeaf33eb912fa5761983.1547566486.git-series.marmarek@invisiblethingslab.com>
 <8ea00e9347ae7859a37ea421e658263a44a375fb.1547566486.git-series.marmarek@invisiblethingslab.com>
 <20190116092129.jz2cts5pwd5ckh34@mac>
 <20190116105218.GM1205@mail-itl>
 <20190116122004.byvr2bttwkttofqs@mac>
 <94C5C3AC020000F30063616D@prv1-mh.provo.novell.com>
 <5C3F2A20020000780020E4A0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=66eY=PY=citrix.com=prvs=912d4b2fb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gjkvR-0002rp-IO
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 13:08:09 +0000
Content-Disposition: inline
In-Reply-To: <5C3F2A20020000780020E4A0@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMTYsIDIwMTkgYXQgMDU6NTc6MDRBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE2LjAxLjE5IGF0IDEzOjIwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gRG8geW91IHRoaW5rIGl0IG1ha2VzIHNlbnNlIHRvIGFkZCBhIGRvbWN0bCB0byBl
bmFibGUvZGlzYWJsZSBNU0koWCk/Cj4gCj4gQSBkb21jdGwgbG9va3Mgb2RkIGZvciBhbiBvcGVy
YXRpb24gbGlrZSB0aGlzOyBJJ2QgcmF0aGVyIGNvbnNpZGVyCj4gYWRkaW5nIGEgcGh5c2Rldm9w
IGlmIGEgbmV3IChzdWIpaHlwZXJjYWxsIGlzIG5lZWRlZCBoZXJlIChvZgo+IHdoaWNoIEknbSBu
b3QgeWV0IGNvbnZpbmNlZDsgSSBoYXZlIHlldCB0byBsb29rIGF0IHRoZSBwYXRjaCkuCgpJIHN1
Z2dlc3RlZCBhIGRvbWN0bCBiZWNhdXNlIHRoaXMgb3BlcmF0aW9uIHdvdWxkIGJlIHBlcmZvcm1l
ZCBieQpjb250cm9sIGRvbWFpbnMsIG5vdCBieSB1bnByaXZpbGVnZWQgZ3Vlc3RzIHRoZW1zZWx2
ZXMsIG11Y2ggbGlrZQpYRU5fRE9NQ1RMX3t1bn1iaW5kX3B0X2lycS4gQWxzbyBpdCB3b24ndCBi
ZSBhIHN0YWJsZSBpbnRlcmZhY2UsIGFuZAp3ZSBjb3VsZCBnZXQgcmlkIG9mIGl0IGluIHRoZSBm
dXR1cmUgaWYgd2UgY2hhbmdlIHRoZSB3YXkgcGFzc3Rocm91Z2gKd29ya3MgKGllOiBieSB1c2lu
ZyB2cGNpIGZvciBndWVzdHMgYWxzbykuCgpCdXQgSSBzZWUgeW91ciBwb2ludCBhYm91dCBtYWtp
bmcgaXQgYSBwaHlzZGV2b3AsIHRoYXQgd291bGQgc2VlbSBsaWtlCnRoZSBiZXN0IGZpdCBjb250
ZXh0IHdpc2UuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
