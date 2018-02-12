From: Andrii Anisov <andrii_anisov@epam.com>
Subject: Re: RTDS with extra time issue
Date: Mon, 12 Feb 2018 13:08:54 +0200
Message-ID: <644eff80-3bf1-fff2-47a0-a1a74cb25c6b@epam.com>
References: <762ccb02-b758-1636-fddc-f4e6a3ca19d0@epam.com>
 <1518182334.5019.15.camel@suse.com>
 <39c08b88-c951-2779-34f6-31e4b6c0dd0f@epam.com>
 <1518189527.5019.28.camel@suse.com>
 <CAENZ-+n1y24akrJZvmkh1eh5exHhr3NQ+33PgjCvNKcFEb74EA@mail.gmail.com>
 <af089b54-1078-681b-430f-c4b2a1a7779d@epam.com>
 <CAENZ-+k547y9V8TCQ7YdYz4-E=TDQ04omtDfwT+zP6ezv6KL1g@mail.gmail.com>
 <1518221652.4261.33.camel@suse.com>
 <CAENZ-+k63FbKdfvaxxEb9UD0F=BQ-g=f1d=uR_VEEOBHr262Dg@mail.gmail.com>
 <1518430638.16540.17.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/ak1=fg=epam.com=andrii_anisov@srs-us1.protection.inumbo.net>)
 id 1elByx-0006TX-7U
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2018 11:09:11 +0000
In-Reply-To: <1518430638.16540.17.camel@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, Meng Xu <xumengpanda@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

RGFyaW8sIE1lbmcsCgoKT24gMTIuMDIuMTggMTI6MTcsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+
IFdlbGwsIEknbGwgbGV0IEFuZHJpaSByZXBseSwgYnV0IGhvbmVzdGx5LCBJIGRvbid0IHRoaW5r
IGl0IGlzLgo+Cj4gU2VlLCBmb3IgaW5zdGFuY2UsIHRoZSBmYWN0IHRoYXQgRG9tUiBoYXMgb25s
eSAxIHZDUFUsIHNvIEkgZmluZCBpdAo+IHVubGlrZWx5IHRoYXQgdGhlIG9ubHkgdGhpbmcgdGhh
dCBydW4gdGhlcmUgaXMgKmp1c3QqICpvbmUqIHJlYWwtdGltZQo+IHRhc2suIDotLwpXaGlsZSBJ
J20gZm9jdXNlZCBtYWlubHkgb24gdGhlIHRvcGljIGRpc2N1c3NlZCBoZXJlIFsxXSwgYSBSVCBk
b21haW4gCndpbGwgaGF2ZSBzb21lIFJUT1Mgd2l0aCBpdHMgc2V0IHRhc2tzIChSVCBhcyB3ZWxs
IGFzIG5vbi1SVCksIGFsc28gaXQgCndvdWxkIGNvbW11bmljYXRlIHdpdGggb3RoZXIgZG9tYWlu
cy4gTGlrZWx5IGl0IHdvdWxkIGJlIG9uZSBSVCBkb21haW4gCnBlciBzeXN0ZW0uClNvIEknbSB0
cnlpbmcgdG8gZXN0aW1hdGUgc29tZWhvdyBpZiBSVERTIGhhcyBpdHMgcHJhY3RpY2FsIHVzYWdl
IG9yIApkZWRpY2F0ZWQgY3B1cG9vbCB3aXRoIG51bGwgc2NoZWR1bGVyIHdpbGwgZG8gdGhlIGpv
Yi4KClsxXSAKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL3BpcGVybWFpbC9hdXRv
bW90aXZlLWRpc2N1c3Npb25zLzIwMTgtSmFudWFyeS8wMDU1OTAuaHRtbAoKLS0gCgoqQW5kcmlp
IEFuaXNvdioKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
