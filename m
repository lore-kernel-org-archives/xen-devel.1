From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] shut down domain when last vCPU goes down
Date: Fri, 16 Feb 2018 09:25:24 -0700
Message-ID: <5A87140402000078001A8847@prv-mh.provo.novell.com>
References: <5A87028802000078001A8759@prv-mh.provo.novell.com>
 <20180216155248.ni6vg3botbbwvb74@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=jcsl=fk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1emipK-00005I-Tz
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 16:25:34 +0000
In-Reply-To: <20180216155248.ni6vg3botbbwvb74@MacBook-Pro-de-Roger.local>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAyLjE4IGF0IDE2OjUyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgRmViIDE2LCAyMDE4IGF0IDA4OjEwOjQ4QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBJJ3ZlIGp1c3QgaGFkIHRvIGRlYWwgd2l0aCBhbiBlYXJseSBib290IGNyYXNoIG9m
IExpbnV4IHdoaWNoIG9jY3VycmVkCj4+IHNvIGVhcmx5IHRoYXQgZXZlbiAiZWFybHlwcmludGs9
eGVuIiBkaWQgbm90IHByb2R1Y2UgYW55IHVzZWZ1bCBvdXRwdXQuCj4+IEhlbmNlIHRoZSBkb21h
aW4gYXBwZWFyZWQgdG8gaGFuZywgd2hpbGUgaW4gZmFjdCBpdCBoYWQgYnJvdWdodCBkb3duIGl0
cwo+PiBvbmx5IHZDUFUuIEJ5IHRyYW5zbGF0aW5nIHRoaXMgdG8gYSBzaHV0ZG93biwgdGhlIHNp
dHVhdGlvbiB3aWxsIGJlCj4+IGJldHRlciByZWNvZ25pemFibGUuCj4+IAo+PiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IAo+IEknbSB3b25kZXJpbmcs
IGlzIGl0IGNvbW1vbiBmb3IgYSBkb21haW4gdG8gc2h1dGRvd24gYnkgc2h1dHRpbmcgZG93bgo+
IGFsbCBpdCdzIHZDUFVzPwo+IAo+IEluIHRoZSBzY2VuYXJpbyB0aGF0IHlvdSBkZXNjcmliZSBh
Ym92ZSBpdCBzZWVtcyBpdCB3b3VsZCBiZSBtb3JlCj4gaGVscGZ1bCB0byBpc3N1ZSBhIFNIVVRE
T1dOX2NyYXNoIGluc3RlYWQgbWF5YmUgd2l0aCBhIGdkcHJpbnRrCj4gbWVzc2FnZSBpbiBvcmRl
ciB0byBhaWQgZGVidWdnaW5nLgoKU2VlaW5nIHRoaXMgSSB3YXMgcHV6emxlZCB0b287IEkgaGF2
ZSBubyBpZGVhIHdoeSBMaW51eCBkb2VzIHRoaXMsCm90aGVyIHRoYW4gdGhpcyBiZWluZyBhbiBh
dHRlbXB0IHRvIHByb3ZpZGUgYSBQViBlcXVpdmFsZW50IG9mIHRoZQpITFQgaW5zdHJ1Y3Rpb24u
IEJ1dCBubywgU0hVVERPV05fY3Jhc2ggaXMgbm90IGFwcHJvcHJpYXRlIGltbwooYW5kIEkgZGlk
IGNvbnNpZGVyIGl0KSAtIHdlIGNhbid0IGtub3cgd2hhdCB0aGUgcmVhc29uIHdhcyBmb3IgdGhl
Cmd1ZXN0IHRvIGlzc3VlIHRoZSBoeXBlcmNhbGw7IGluIHBhcnRpY3VsYXIgd2Ugc2hvdWxkbid0
IHRyaWdnZXIKYWN0aW9ucyAobGlrZSBkdW1waW5nKSB0aGF0IGFyZSBsaWtlbHkgdGllZCB0byBh
IGNyYXNoIHVubGVzcyB3ZSdyZQpzdXJlIHRoZXJlIHdhcyBhIGNyYXNoLgoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
