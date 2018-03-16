From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v10 09/11] vpci/msi: add MSI handlers
Date: Fri, 16 Mar 2018 10:24:04 -0600
Message-ID: <5AABFDB402000078001B2E97@prv-mh.provo.novell.com>
References: <20180316133008.66443-1-roger.pau@citrix.com>
 <20180316133008.66443-10-roger.pau@citrix.com>
 <5AABDD1702000078001B2D77@prv-mh.provo.novell.com>
 <20180316143412.lkqyavr2vepsdktc@MacBook-Pro-de-Roger.local>
 <5AABEB5802000078001B2E24@prv-mh.provo.novell.com>
 <20180316153802.sgvxp37z532nuutt@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=krzt=gg=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ews9P-0003mE-0h
 for xen-devel@lists.xenproject.org; Fri, 16 Mar 2018 16:24:15 +0000
In-Reply-To: <20180316153802.sgvxp37z532nuutt@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, AndrewCooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAzLjE4IGF0IDE2OjM4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgTWFyIDE2LCAyMDE4IGF0IDA5OjA1OjQ0QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTYuMDMuMTggYXQgMTU6MzQsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gdnBjaV9yZW1vdmVfZGV2aWNlIGlzIG5ldmVyIGNhbGxlZCBmcm9tIHRoZSB1
c2VyLXNwYWNlIHRlc3QgaGFybmVzcywKPj4gPiBzbyBpdCBqdXN0IG5lZWRzIHRvIGJ1aWxkLCBi
dXQgbm90IG5lY2Vzc2FyaWx5IGJlIGNvcnJlY3QgaW4gdGhhdAo+PiA+IGNvbnRleHQuCj4+ID4g
Cj4+ID4gVGhlIHRlc3QgaGFybmVzcyBkb2Vzbid0IHVzZSB2cGNpX2FkZF9oYW5kbGVycyBvciB2
cGNpX3JlbW92ZV9kZXZpY2UsCj4+ID4gaXQganVzdCBhZGRzIGFuZCByZW1vdmVzIGhhbmRsZXJz
IHVzaW5nIHZwY2lfYWRkX3JlZ2lzdGVyIGFuZAo+PiA+IHZwY2lfcmVtb3ZlX3JlZ2lzdGVyLgo+
PiAKPj4gSSBkaXNsaWtlIHN1Y2ggYSBzZXR1cCAtIHRoZW4geW91J2QgYmV0dGVyICNpZmRlZiBv
dXQgdGhlIGVudGlyZQo+PiBmdW5jdGlvbiwgYW5kIHVuZG8gc29tZSBvZiB0aGUgb3RoZXIgcmVj
ZW50bHkgYWRkZWQgI2lmZGVmLWFyeS4KPiAKPiBPSywgSSd2ZSBkb25lIGl0IHRoYXQgd2F5IGlu
aXRpYWxseSB0byBwcmV2ZW50IHBvbGx1dGluZyB2cGNpLmMgd2l0aAo+IF9fWEVOX18gaWZkZWZz
LiBUaGUgcGF0Y2ggYmVsb3cgaWZkZWZzIHRob3NlIHVudXNlZCBmdW5jdGlvbnMuCgpMb29rcyBs
aWtlIGFuIG92ZXJhbGwgaW1wcm92ZW1lbnQgdG8gbWUuCgpKYW4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
