From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 10/19] xen: setup hypercall page for PVH
Date: Wed, 21 Nov 2018 14:58:14 +0100
Message-ID: <cc1c8a7d-5dc9-8b2e-6751-f3a4c4237dff@suse.com>
References: <20181102123738.16395-1-jgross@suse.com>
 <20181102123738.16395-11-jgross@suse.com>
 <20181109181249.GD4363@olila.i.net-space.pl>
 <0885fcf7-ce75-6457-d535-d44b2b86f7c4@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <0885fcf7-ce75-6457-d535-d44b2b86f7c4@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: hans@knorrie.org, grub-devel@gnu.org, xen-devel@lists.xen.org, phcoder@gmail.com
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMTEvMjAxOCAxMDoyNywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwOS8xMS8yMDE4
IDE5OjEyLCBEYW5pZWwgS2lwZXIgd3JvdGU6Cj4+IE9uIEZyaSwgTm92IDAyLCAyMDE4IGF0IDAx
OjM3OjI5UE0gKzAxMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Pj4+ICsKPj4+ICsgIGFzbSB2b2xh
dGlsZSAoIndybXNyIiA6IDogImMiIChtc3IpLCAiYSIgKHBmbiksICJkIiAoMCkgOiAibWVtb3J5
Iik7Cj4+PiArfQo+Pj4gKwo+Pj4gK2ludAo+Pj4gK2dydWJfeGVuX2h5cGVyY2FsbCAoZ3J1Yl91
aW50MzJfdCBjYWxsbm8sIGdydWJfdWludDMyX3QgYTAsCj4+PiArCQkgICAgZ3J1Yl91aW50MzJf
dCBhMSwgZ3J1Yl91aW50MzJfdCBhMiwKPj4+ICsJCSAgICBncnViX3VpbnQzMl90IGEzLCBncnVi
X3VpbnQzMl90IGE0LAo+Pj4gKwkJICAgIGdydWJfdWludDMyX3QgYTUgX19hdHRyaWJ1dGVfXyAo
KHVudXNlZCkpKQo+Pj4gK3sKPj4+ICsgIGdydWJfdWludDMyX3QgX19yZXMsIF9faWduMCwgX19p
Z24xLCBfX2lnbjIsIF9faWduMywgX19pZ240Owo+Pj4gKwo+Pj4gKyAgYXNtIHZvbGF0aWxlICgi
Y2FsbCAqJVtjYWxsbm9dIgo+Pj4gKwkJOiAiPWEiIChfX3JlcyksICI9YiIgKF9faWduMCksICI9
YyIgKF9faWduMSksICI9ZCIgKF9faWduMiksCj4+PiArCQkgICI9UyIgKF9faWduMyksICI9RCIg
KF9faWduNCkKPj4+ICsJCTogIjEiIChhMCksICIyIiAoYTEpLCAiMyIgKGEyKSwgIjQiIChhMyks
ICI1IiAoYTQpLAo+Pgo+PiBJIHRoaW5rIHRoYXQgeW91IGNhbiBkcm9wIGFsbCBfX2lnbiogdmFy
aWFibGVzIGlmIHlvdSBzcGVjaWZ5IHByb3Blcgo+PiByZWdpc3RlcnMgaW4gaW5wdXQgYXJndW1l
bnQuIElmIHRoaXMgZG9lcyBub3Qgd29yayB5b3UgY2FuIHVzZSAiKyIKPj4gbW9kaWZpZXIgaW5z
dGVhZCBvZiAiPSIgaW4gdGhlIG91dHB1dCBhcmd1bWVudC4KPiAKPiBJJ2xsIGhhdmUgYSB0cnku
CgpEb2Vzbid0IHdvcmsuCgpTcGVjaWZ5aW5nIG9ubHkgdGhlIGlucHV0IHJlZ2lzdGVycyBuZWds
ZWN0cyB0aGUgaHlwZXJjYWxsCmNsb2JiZXJpbmcgdGhvc2UuCgpVc2luZyB0aGUgIisiIG1vZGlm
aWVyIGxldHMgZ2NjIGNvbXBsYWluLgoKSSdsbCBqdXN0IHVzZSBhIHNpbmdsZSBkdW1teSB2YXJp
YWJsZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
