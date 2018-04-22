From: Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v8 1/9] x86/xpti: avoid copying L4 page
 table contents when possible
Date: Sun, 22 Apr 2018 17:39:46 +0100
Message-ID: <20180422163946.GA66778@deinos.phlegethon.org>
References: <20180418083051.8334-1-jgross@suse.com>
 <20180418083051.8334-2-jgross@suse.com>
 <5AD76E5A02000078001BC770@suse.com>
 <35756e6c-dc79-f0a1-df31-bca0495e3352@suse.com>
 <5AD847BD02000078001BC8D9@suse.com>
 <58b2d6ba-381d-4f4e-e0bb-bf6281ba6ac6@suse.com>
 <20180421133208.GA61756@deinos.phlegethon.org>
 <7a0d30e0-1c7c-c7f5-6bd0-81709ea3890a@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=amxu=hl=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1fAI1s-0005i2-9W
 for xen-devel@lists.xenproject.org; Sun, 22 Apr 2018 16:39:56 +0000
Content-Disposition: inline
In-Reply-To: <7a0d30e0-1c7c-c7f5-6bd0-81709ea3890a@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

QXQgMTk6MTEgKzAyMDAgb24gMjEgQXByICgxNTI0MzM3ODkzKSwgSnVlcmdlbiBHcm9zcyB3cm90
ZToKPiBPbiAyMS8wNC8xOCAxNTozMiwgVGltIERlZWdhbiB3cm90ZToKPiA+IEF0IDA5OjQ0ICsw
MjAwIG9uIDE5IEFwciAoMTUyNDEzMTA4MCksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gPj4gQW5v
dGhlciBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byBwYXNzIGFub3RoZXIgZmxhZyB0byB0aGUgY2Fs
bGVycyB0bwo+ID4+IHNpZ25hbCB0aGUgbmVlZCBmb3IgYSBmbHVzaC4gVGhpcyB3b3VsZCByZXF1
aXJlIHF1aXRlIHNvbWUgbW9kaWZpY2F0aW9ucwo+ID4+IHRvIHNoYWRvdyBjb2RlIEknZCBsaWtl
IHRvIGF2b2lkLCB0aG91Z2guIE9UT0ggdGhpcyB3YXkgd2UgY291bGQgY29tYmluZQo+ID4+IGZs
dXNoaW5nIHRoZSB0bGIgYW5kIHRoZSByb290IHBhZ2UgdGFibGVzLiBUaW0sIGFueSBwcmVmZXJl
bmNlcz8KPiA+IAo+ID4gVGhpcyBzb3VuZHMgYSBwcm9taXNpbmcgZGlyZWN0aW9uIGJ1dCBpdCBz
aG91bGQgYmUgZG9hYmwgd2l0aG91dCBtYWpvcgo+ID4gc3VyZ2VyeSB0byB0aGUgc2hhZG93IGNv
ZGUuICBUaGUgc2hhZG93IGNvZGUgYWxyZWFkeSBsZWF2ZXMgb2xkIHNsNGVzCj4gPiB2aXNpYmxl
IChpbiBUTEJzKSB3aGVuIGl0J3Mgc2FmZSB0byBkbyBzbywgc28gSSB0aGluayB0aGUgcmlnaHQg
cGxhY2UKPiA+IHRvIGhvb2sgdGhpcyBpcyBvbiB0aGUgcmVjZWl2aW5nIHNpZGUgb2YgdGhlIFRM
QiBmbHVzaCBJUEkuICBJT1cgYXMKPiA+IGxvbmcgYXM6Cj4gPiAgLSB5b3UgY29weSB0aGUgTDQg
b24gY29udGV4dCBzd2l0Y2g7IGFuZAo+ID4gIC0geW91IGNvcHkgaXQgb24gdGhlIFRMQiBmbHVz
aCBJUEkgaXMgcmVjZWl2ZWQKPiA+IHRoZW4geW91IGNhbiByZWx5IG9uIHRoZSBleGlzdGluZyBU
TEIgZmx1c2ggbWVjaGFuaXNtcyB0byBkbyB3aGF0IHlvdSBuZWVkLgo+ID4gQW5kIHNoYWRvdyBk
b2Vzbid0IGhhdmUgdG8gYmVoYXZlIGRpZmZlcmVudGx5IGZyb20gJ25vcm1hbCcgUFYgTU0uCj4g
Cj4gSXQgaXMgbm90IHNvIGVhc3kuIFRoZSBwcm9ibGVtIGlzIHRoYXQgZS5nLiBhIHBhZ2UgZmF1
bHQgd2lsbCBmbHVzaCB0aGUKPiBUTEIgZW50cnkgZm9yIHRoZSBwYWdlIGluIHF1ZXN0aW9uLCBi
dXQgaXQgd29uJ3QgbGVhZCB0byB0aGUgTDQgdG8gYmUKPiBjb3BpZWQuCgpPaCB5ZXMsIEkgc2Vl
OyB0aGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbi4gIEl0IG1pZ2h0IGJlIHdvcnRoIGNvcHlpbmcK
d2hhdCB0aGUgaGFyZHdhcmUgZG9lcyBoZXJlLCBhbmQgY2hlY2tpbmcvcHJvcGFnYXRpbmcgdGhl
IHJlbGV2YW50IGw0ZQppbiB0aGUgUFYgcGFnZWZhdWx0IGhhbmRsZXIuCgpUaW0uCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
