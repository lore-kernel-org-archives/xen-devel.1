From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/VMX: don't risk corrupting host CR4
Date: Fri, 9 Mar 2018 14:35:07 +0000
Message-ID: <c5deba36-5af1-cbed-8fef-407f8cc97476@citrix.com>
References: <5AA2A5D202000078001B0490@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=urml=f7=citrix.com=prvs=59921bcad=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1euJ7V-0001pz-KY
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 14:35:41 +0000
In-Reply-To: <5AA2A5D202000078001B0490@prv-mh.provo.novell.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDMvMTggMTQ6MTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEluc3RlYWQgb2YgInN5bmNp
bmciIHRoZSBsaXZlIHZhbHVlIHRvIHdoYXQgbW11X2NyNF9mZWF0dXJlcyBoYXMsIG1ha2UKPiBz
dXJlIHZDUFUtcyBydW4gd2l0aCB0aGUgdmFsdWUgbW9zdCByZWNlbnRseSBsb2FkZWQgaW50byAl
Y3I0LCBzdWNoIHRoYXQKPiBhZnRlciB0aGUgbmV4dCBWTSBleGl0IHdlIGNvbnRpbnVlIHRvIHJ1
biB3aXRoIHRoZSBpbnRlbmRlZCB2YWx1ZSByYXRoZXIKPiB0aGFuIGEgcG9zc2libHkgc3RhbGUg
b25lLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
IC0tLQo+IFRCRDogSXMgdGhlIGNvbmRpdGlvbmFsIHJlYWxseSB3b3J0aHdoaWxlLCBpLmUuIGlz
IHRoZSBWTVdSSVRFIHBlcmhhcHMKPiAgICAgIG5vdCBtZWFuaW5nZnVsbHkgbW9yZSBleHBlbnNp
dmUgdGhhbiB0aGUgVk1SRUFEPwoKV2hpY2ggYml0cyBhcmUgeW91IHdvcnJpZWQgYWJvdXQgaGVy
ZT/CoCBXZSBwbGF5IHdpdGggJWNyNCBxdWl0ZSBhIGJpdCBpbgpQViBjb250ZXh0LCBidXQgd2Ug
c2hvdWxkbid0IGJlIGNoYW5naW5nIGFmdGVyIGJvb3QgaW4gSFZNIGNvbnRleHQuCgp+QW5kcmV3
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
