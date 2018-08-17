From: Juergen Gross <jgross@suse.com>
Subject: Re: Future of 32-bit PV support
Date: Fri, 17 Aug 2018 06:10:18 +0200
Message-ID: <5c4aceb4-0ca6-4130-8dbc-4f0b97e347b2@suse.com>
References: <ede80e02-5704-1d46-4edf-58515ad63f40@suse.com>
 <alpine.DEB.2.10.1808161033060.16354@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vru5=la=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fqW5c-0000WT-VX
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 04:10:20 +0000
In-Reply-To: <alpine.DEB.2.10.1808161033060.16354@sstabellini-ThinkPad-X260>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, bouyer@NetBSD.org, "xen-users@lists.xenproject.org" <xen-users@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDgvMTggMTk6MzQsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBUaHUsIDE2
IEF1ZyAyMDE4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBJbiB0aGUgWGVuIHg4NiBjb21tdW5p
dHkgY2FsbCB3ZSBoYXZlIGJlZW4gZGlzY3Vzc2luZyB3aGV0aGVyIGFueW9uZQo+PiByZWFsbHkg
aXMgZGVwZW5kaW5nIG9uIDMyLWJpdCBQViBndWVzdHMuIFdlJ2QgbGlrZSB0byBldmFsdWF0ZSB3
aGV0aGVyCj4+IGFueW9uZSB3b3VsZCBzZWUgcHJvYmxlbXMgd2l0aDoKPj4KPj4gLSBkZXByZWNh
dGluZyAzMi1iaXQgUFYgZ3Vlc3Qgc3VwcG9ydCBpbiBYZW4sIG1lYW5pbmcgdGhhdCB3ZSdkCj4+
ICAgZXZlbnR1YWxseSBzd2l0Y2ggdG8gc3VwcG9ydCAzMi1iaXQgUFYgZ3Vlc3RzIG9ubHkgdmlh
IFBWLXNoaW0gZnJvbQo+PiAgIFhlbiA0LjEyIG9yIDQuMTMKPj4KPj4gLSBkcm9wcGluZyAzMi1i
aXQgUFYgc3VwcG9ydCBmcm9tIHVwc3RyZWFtIExpbnV4IGtlcm5lbCwgcmVzdWx0aW5nIGluCj4+
ICAgY3VycmVudCAzMi1iaXQgUFYgZ3Vlc3RzIG5vIGxvbmdlciBiZWluZyBhYmxlIHRvIHVwZ3Jh
ZGUgdG8gdGhlIG5ld2VzdAo+PiAgIGtlcm5lbCB2ZXJzaW9uIGFueSBsb25nZXIKPj4KPj4gQW5k
IHJlbGF0ZWQgdG8gdGhhdDoKPj4KPj4gLSBpcyB0aGVyZSBhbnkgTGludXggZGlzdHJpYnV0aW9u
IHN0aWxsIHNoaXBwaW5nIDMyLWJpdCBQVi1jYXBhYmxlCj4+ICAgc3lzdGVtcz8KPj4KPj4gLSB3
aGF0IGFib3V0IEJTRD8gSXMgMzItYml0IFBWIHN1cHBvcnQgaW1wb3J0YW50IHRoZXJlPwo+IAo+
IEhpIEp1ZXJnZW4sCj4gCj4gQWx0aG91Z2ggSSBjYW4gc2VlIHRoYXQgZGVwcmVjYXRpbmcgMzIt
Yml0IFBWIGd1ZXN0IHN1cHBvcnQgaXMKPiBkZXNpcmFibGUsIGFuZCBpdCBtaWdodCBub3QgY2F1
c2UgYW55IHByb2JsZW1zIHRvIExpbnV4IGFuZAo+IEJTRHMsIHdlIG5lZWQgdG8gYmUgY2FyZWZ1
bCBhYm91dCB1bmlrZXJuZWxzLgo+IAo+IFRoZXJlIGFyZSBwcm9iYWJseSB1bmlrZXJuZWxzIG91
dCB0aGVyZSB0aGF0IG9ubHkgc3VwcG9ydCBQViAzMmJpdAo+IHN0aWxsLiBBbmQgd2h5IG5vdD8g
SWYgeW91IGFyZSBkZXNpZ25pbmcgYSB1bmlrZXJuZWwgdG9kYXksIGl0IHdvdWxkCj4gc3RpbGwg
bWFrZSBzZW5zZSB0byB1c2UgUFYgMzJiaXQgb3IgUFZILgoKUFZIIHdpbGwgc3RpbGwgd29yaywg
b2YgY291cnNlLiAzMi0gYW5kIDY0LWJpdC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
