From: Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: Radical proposal: ship not-fully-tidied shim as
	4.10.1
Date: Tue, 9 Jan 2018 06:45:46 -0800
Message-ID: <CA+aC4kt0PMLC83tBy3PzT2U0PRU42TgEvj9RszEqyfcKoyLErQ@mail.gmail.com>
References: <23123.44604.284781.889416@mariner.uk.xensource.com>
 <08bdc18d-7d05-9e56-5a7a-513603698576@citrix.com>
 <23124.40532.270809.189921@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=n3h8=ee=codemonkey.ws=anthony@srs-us1.protection.inumbo.net>)
 id 1eYv9y-00033s-T4
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 14:45:50 +0000
Received: by mail-lf0-x235.google.com with SMTP id u2so1752454lff.7
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2018 06:45:48 -0800 (PST)
In-Reply-To: <23124.40532.270809.189921@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Juergen Gross <JGross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, committers@xenproject.org, security@xenproject.org, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gOSwgMjAxOCBhdCAyOjQ5IEFNLCBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4gd3JvdGU6Cj4gQW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogUmFkaWNh
bCBwcm9wb3NhbDogc2hpcCBub3QtZnVsbHktdGlkaWVkIHNoaW0gYXMgNC4xMC4xIik6Cj4+IERv
ZXMgdGhpcyBzb3VuZCBmYWlyPwo+Cj4gRXZlcnl0aGluZyBpcyBvbiBmaXJlLiAgWW91ciBwcm9w
b3NhbCBzZWVtcyBtdWNoIGxlc3MgcmFkaWNhbCB0aGFuCj4gbWluZS4gIEkgZG91YnQgaXQgd2ls
bCBwcm9kdWNlIGEgcmVsZWFzZSB0byBvdXIgdXNlcnMgdG9tb3Jyb3csIGxldAo+IGFsb25lIHRo
aXMgd2Vlay4KPgo+IElmIHdlIGNhbid0IGdldCBhZ3JlZW1lbnQgdG8gY29tbWl0IGFuIHVuZGVy
LXJldmlld2VkIGFuZCB1bmRlci10ZXN0ZWQKPiBzZXJpZXMgdG8gc3RhZ2luZy00LjEwLCB0aGVu
IElNTyB3ZSBzaG91bGQgZm9yayA0LjEwIGFuZCBtYWtlIGFuCj4gZW1lcmdlbmN5IHNlY3VyaXR5
IHJlbGVhc2Ugb2ZmIHRoZSBmb3JrLCBpbnN0ZWFkLgoKTXkgc2VyaWVzIGlzIG9uIHRvcCBvZiBz
dGFnaW5nIGFuZCBJIGFscmVhZHkgaGF2ZSBhIGJhY2twb3J0IHRvIDQuOQphbmQgNC4xMCBzdGFi
bGUgcHVibGlzaGVkLgoKSSB3aWxsIGNoZXJyeSBwaWNrIGFzIG11Y2ggYXMgSSBjYW4gZnJvbSBX
ZWkncyBicmFuY2ggdGhpcyBtb3JuaW5nIGFuZApzZW5kIG91dCBhIHYzLiAgSSB3aWxsIHRyeQp0
byBjbG9zZSB0aGUgbWlncmF0aW9uLCBob3RwbHVnLCBiYWxsb29uaW5nIGdhcC4KCkkgZG8gdGhp
bmsgaXQncyB1c2VmdWwgZm9yIGZvbGtzIHRvIHJldmlldyB0aGUgc2VyaWVzIGRlZXBseS4gIEl0
J3MKbm90IHRoYXQgYmlnIHNvIGl0IHNob3VsZCB0YWtlIGFsbCB0aGF0CmxvbmcgdG8gZG8gc28u
CgpJIHRoaW5rIHYzIG9mIG15IHNlcmllcyBpcyBsaWtlbHkgdGhlIGNsb3Nlc3QgdG8gc29tZXRo
aW5nIHRoYXQgY2FuIGJlCm1lcmdlZCB0aGlzIHdlZWsuCgpSZWdhcmRzLAoKQW50aG9ueSBMaWd1
b3JpCgo+IElhbi4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
