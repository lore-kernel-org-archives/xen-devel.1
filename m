From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [OSSTEST PATCH] ts-depriv-audit-qemu: Leaked
 substeps are `blocked', and then script is fail
Date: Fri, 6 Jul 2018 13:41:25 +0100
Message-ID: <20180706124125.GC2195@perard.uk.xensource.com>
References: <1530875634-20958-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=x4y5=jw=citrix.com=prvs=71861489f=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fbQ3F-0007MR-IF
 for xen-devel@lists.xenproject.org; Fri, 06 Jul 2018 12:41:29 +0000
Content-Disposition: inline
In-Reply-To: <1530875634-20958-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKdWwgMDYsIDIwMTggYXQgMTI6MTM6NTRQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gSWYgdGh1cyBzY3JpcHQgY3Jhc2ggaW4gc29tZSBub24tc3Vic3RlcC1zcGVjaWZpYyBv
cGVyYXRpb24sIHRoZQo+IHN1YnN0ZXBzIG1heSBoYXZlIGJlZW4gY3JlYXRlZCAoYW5kIHRodXMg
YmUgaW4gdGhlIGRiIGFzIGBydW5uaW5nJykuCj4gTGVhdmluZyB0aGVtIGxpa2UgdGhpcyBpcyBu
b3QgYWxsb3dlZDogaXQgaXMgdHJlYXRlZCBieSBzZy1ydW4tam9iLAo+IGFuZCBieSB0aGUgYXJj
aGFlb2xvZ2lzdHMgYXMgYW4gaW50ZXJuYWwgZXJyb3IuCj4gCj4gSWYgdGhpcyBoYXBwZW5zLCB3
aGF0IHdlIHdhbnQgaXMgZm9yIHRoZSBzY3JpcHQgYXMgYSB3aG9sZSB0byBiZQo+IGBmYWlsJywg
YW5kIGZvciB0aGUgZmFpbGluZyB0ZXN0cyB0byBiZSBgYmxvY2tlZCcuICBUaGUgZm9ybWVyIHdp
bGwKPiBzcG90IGlmIHRoaXMgY3Jhc2ggaXMgYSByZWdyZXNzaW9uLiAgVGhlIGxhdHRlciB3aWxs
IGF2b2lkIHRyZWF0aW5nCj4gdGhlIHN1YnN0ZXBzIHRoZW1zZWx2ZXMgYXMgcmVncmVzc2lvbnMu
Cj4gCj4gUmVwb3J0ZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXgu
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5jaXRyaXgu
Y29tPgo+IC0tLQo+ICB0cy1kZXByaXYtYXVkaXQtcWVtdSB8IDExICsrKysrKysrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3RzLWRlcHJp
di1hdWRpdC1xZW11IGIvdHMtZGVwcml2LWF1ZGl0LXFlbXUKPiBpbmRleCA4MWJkNWMwLi4zYzIx
OGQ5IDEwMDc1NQo+IC0tLSBhL3RzLWRlcHJpdi1hdWRpdC1xZW11Cj4gKysrIGIvdHMtZGVwcml2
LWF1ZGl0LXFlbXUKPiBAQCAtMTE4LDEwICsxMTgsMjEgQEAgc3ViIGF1ZGl0X2Zpc2ggKCkgewo+
ICAgICAgZm9yZWFjaCBteSAkY2wgKHNvcnQga2V5cyAlY2xhc3Nlcykgewo+ICAJc3Vic3RlcF9m
aW5pc2goIi8kY2wiLCAkY2xhc3Nlc3skY2x9IHx8ICdwYXNzJyk7Cj4gIAkjIChpZiB0aGVyZSBh
cmUgbm8gZmRzIG9mIHRoaXMgY2xhc3MsIG1heWJlIHRoZXkgd2VyZSBhbGwgY2xvc2VkKQo+ICsJ
JGNsYXNzZXN7JGNsfSA9ICdyZXBvcnRlZCc7CgpUaGUgY2FzZSBoZXJlIGlzIGRpZmZlcmVudCB0
aGFuIC4uLgoKPiAgICAgIH0KPiAgICAgIGxvZ20oImF1ZGl0IGNvbXBsZXRlLi4uIik7Cj4gIH0K
PiAgCj4gK0VORCB7Cj4gKyAgICBmb3JlYWNoIG15ICRjbCAoc29ydCBrZXlzICVjbGFzc2VzKSB7
Cj4gKwlteSAkc3QgPSAkY2xhc3Nlc3skY2x9Owo+ICsJbmV4dCBpZiAkc3QgZXEgJ1JFUE9SVEVE
JzsKCi4uIGhlcmUuIElzIHRoZXJlIHNvbWV0aGluZyBJJ20gbWlzc2luZyBvciBzaG91bGQgaXQg
YmUgdGhlIHNhbWU/CgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
