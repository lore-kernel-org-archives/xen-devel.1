From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] libx86: Work around GCC bug with ebx output
 constrants
Date: Mon, 19 Nov 2018 07:23:19 -0700
Message-ID: <5BF2C75702000078001FD7F6@prv1-mh.provo.novell.com>
References: <1542633088-11101-1-git-send-email-andrew.cooper3@citrix.com>
 <5BF2BFDE02000078001FD7D2@prv1-mh.provo.novell.com>
 <743294a2-4cee-5573-abfc-ba6817e7d32e@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <743294a2-4cee-5573-abfc-ba6817e7d32e@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjExLjE4IGF0IDE1OjA4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTkvMTEvMjAxOCAxMzo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE5
LjExLjE4IGF0IDE0OjExLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBJ
biBwcmFjdGljZSwgdGhpcyBpcyBhIGNvbGxpc2lvbiBiZXR3ZWVuIHRoZSBvdXRwdXQgY29uc3Ry
YWludCBhbmQgdGhlIEdPVAo+Pj4gd2hpY2ggaXMgaGVsZCBpbiAlZWJ4IHdoZW4gY29tcGlsaW5n
IHdpdGggLWZQSUMgZm9yIGxpYnJhcmllcy4KPj4+Cj4+PiBUaGlzIGFmZmVjdHMgYXQgbGVhc3Qg
R0NDIDQuOSBhcyBzaGlwcGVkIGluIERlYmlhbiBKZXNzaWUsIGJ1dCBleHBlcmltZW50YWxseQo+
Pj4gaXMgZml4ZWQgaW4gR0NDIDYgYW5kIGxhdGVyLiAgQ3VyaW91c2x5LCBpdCBvbmx5IGFmZmVj
dHMgMzItYml0IGJ1aWxkcy4KPj4gSSBkb24ndCB0aGluayB0aGVyZSdzIGFueXRoaW5nIGN1cmlv
dXMgaGVyZTogVGhlIEdPVCAob3IgYWN0dWFsbHkKPj4gLnJvZGF0YSBoZXJlKSBnZXRzIGFjY2Vz
c2VkIGJ5ICVyaXAtcmVsYXRpdmUgYWRkcmVzc2luZyBpbiBzbWFsbAo+PiBtb2RlbCA2NC1iaXQg
Y29kZSwgaWlyYy4KPiAKPiBBYWggLSBnb29kIHBvaW50LCBhbmQgYWxzbyBleHBsYWlucyB0aGUg
b3RoZXIgY29uZGl0aW9uYWxzIGluIEdDQydzCj4gaW50cmluc2ljIGhlYWRlci4KPiAKPiBJJ2xs
IHVwZGF0ZSB0aGUgbG9naWMgdG8gY29wZSB3aXRoIHRoZSBsYXJnZXIgNjRiaXQgbW9kZWxzLgoK
RG8geW91IG5lZWQgdG8/IFRoZSBBQkkgc3BlY2lmaWVzIHRoYXQgdGhlIEdPVCBwb2ludGVyIGxp
dmVzCmluICVyMTUgaW4gdGhhdCBjYXNlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
