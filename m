From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 4/6] xen/x86: disable global pages for
 domains with XPTI active
Date: Fri, 2 Mar 2018 12:30:21 +0100
Message-ID: <2825c4d1-c7a0-2f02-a159-cd9b70bba9d9@suse.com>
References: <20180302081403.16953-1-jgross@suse.com>
 <20180302081403.16953-5-jgross@suse.com>
 <20180302110304.xdwsrossmbdl4hg4@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=wrb9=fy=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eritO-0003Cn-5s
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 11:30:26 +0000
In-Reply-To: <20180302110304.xdwsrossmbdl4hg4@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, dfaggioli@suse.com, jbeulich@suse.com, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDMvMTggMTI6MDMsIFdlaSBMaXUgd3JvdGU6Cj4gT24gRnJpLCBNYXIgMDIsIDIwMTgg
YXQgMDk6MTQ6MDFBTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gSW5zdGVhZCBvZiBm
bHVzaGluZyB0aGUgVExCIGZyb20gZ2xvYmFsIHBhZ2VzIHdoZW4gc3dpdGNoaW5nIGFkZHJlc3MK
Pj4gc3BhY2VzIHdpdGggWFBUSSBiZWluZyBhY3RpdmUganVzdCBkaXNhYmxlIGdsb2JhbCBwYWdl
cyB2aWEgJWNyNAo+PiBjb21wbGV0ZWx5IHdoZW4gYSBkb21haW4gc3ViamVjdCB0byBYUFRJIGlz
IGFjdGl2ZS4gVGhpcyBhdm9pZHMgdGhlCj4+IG5lZWQgZm9yIGV4dHJhIFRMQiBmbHVzaGVzIGFz
IGxvYWRpbmcgJWNyMyB3aWxsIHJlbW92ZSBhbGwgVExCCj4+IGVudHJpZXMuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAKPiBJIHRoaW5rIHlv
dSBwYXRjaCB0cmllcyB0byBkaXNhYmxlIFBHRSB3aG9sZXNhbGUgZm9yIFhlbiwgYnV0IEkgZG9u
J3QKPiB0aGluayB0aGlzIHBhdGNoIGNhdGNoZXMgYWxsIG9mIHRoZW0uCgpJIGRvIGl0IG9ubHkg
d2hpbGUgYSBkb21haW4gc3ViamVjdCB0byBYUFRJIGlzIGFjdGl2ZSBvbiB0aGUgY3B1LgoKPiBY
RU5fTUlOSU1BTF9DUjQgc3RpbGwgaGFzIFBHRSBpbiBpdC4gRUZJIHBhdGggYW5kIHRoZSBzdGFj
ayByZXN5bmNpbmcKPiBhc20gaW4gX19zdGFydF94ZW4gYXJlIG1pc3NpbmcuCgpUaGF0J3Mgb24g
cHVycG9zZS4gV2l0aG91dCBYUFRJIChlLmcuIG9uIEFNRCBjcHVzKSBQR0UgaXMgc3RpbGwgZ29v
ZApmb3IgcGVyZm9ybWFuY2Ugb2YgNjQtYml0IHB2IGRvbWFpbnMgKGJ1dCB0aGF0J3MgdGhlIG9u
bHkgY2FzZSBBRkFJSykuCgo+IFlvdSBhbHNvIG1pc3NlZCBmaXhpbmcgdGhlIGNvbW1lbnQgb2Yg
c2V0dGluZyBNVFJSLiBJdCBpcyBub3QgYSBiaWcgZGVhbAo+IHRob3VnaC4KCkknbSBub3Qgc3Vy
ZSB0aGlzIGNvbW1lbnQgd2FudHMgdG8gYmUgbW9kaWZpZWQgYXMgbm9ybWFsbHkgUEdFIGlzIHN0
aWxsCm9uLCBlLmcuIHdoZW4gYm9vdGluZy4gVGhlIG9ubHkgY2FzZSBJIGNvdWxkIHRoaW5rIG9m
IHdoZXJlIE1UUlIgd291bGQKYmUgbW9kaWZpZWQgd2l0aCBQR0Ugb2ZmIHNob3VsZCBiZSBhIGRv
bTAgaHlwZXJjYWxsLCBlLmcuClhFTlBGX2FkZF9tZW10eXBlLgoKPiBJIGhhdmUgaW4gZmFjdCB3
cml0dGVuIGEgc21hbGwgc2VyaWVzIHRvIG1ha2UgQ1I0LlBHRSBjb25maWd1cmFibGUgYnV0Cj4g
aGF2ZW4ndCBnb3QgYXJvdW5kIHRvIHNlbmQgdGhlIHBhdGNoZXMgeWV0IGJlY2F1c2UgSSBkaWRu
J3QgdGhpbmsgaXQgaXMKPiB2ZXJ5IHVzZWZ1bCBpbiBpdHMgb3duLgoKRGVwZW5kcyBvbiB3aGV0
aGVyIHJlLXVzaW5nIGdsb2JhbCBUTEIgZW50cnkgc2F2ZXMgbW9yZSB0aGFuIGZsdXNoaW5nCnRo
ZSBUTEIgZnJvbSBnbG9iYWwgcGFnZXMgZG9lcyBjb3N0LgoKCkp1ZXJnZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
