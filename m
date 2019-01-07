From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/string: Fix strcmp() and strncmp()
Date: Mon, 07 Jan 2019 01:04:30 -0700
Message-ID: <5C33080E020000780020AA71@prv1-mh.provo.novell.com>
References: <1546621255-9256-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1546621255-9256-1-git-send-email-andrew.cooper3@citrix.com>
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

Pj4+IE9uIDA0LjAxLjE5IGF0IDE4OjAwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhlIEMgc3BlYyByZXF1aXJlcyB0aGF0IHRoZSBjb21hcmlzb24gYmUgZG9uZSBpbiB0
ZXJtcyBvZiB1bnNpZ25lZCBjaGFyLgo+IAo+IFRoZSBjb2RlIHN0eWxlIGluIHRoaXMgZmlsZSBp
cyB0ZXJyaWJsZSwgYnV0IGRvZXMgY2xhaW0gdG8gYmUgWGVuIEJTRCBzdHlsZSwKPiBzbyBmaXgg
dXAgdGhlc2UgZnVuY3Rpb25zIHdoaWxlIHJld3JpdGluZyB0aGVtLgoKV2hlcmUgaGF2ZSB5b3Ug
Zm91bmQgdGhpcyBjbGFpbT8gVGhlIGNvbW1lbnQgYXQgdGhlIGJvdHRvbSBoYXMKCiAqIGMtZmls
ZS1zdHlsZTogIkJTRCIKICogYy1iYXNpYy1vZmZzZXQ6IDgKICogdGFiLXdpZHRoOiA4CiAqIGlu
ZGVudC10YWJzLW1vZGU6IHQKCmkuZS4gY2xlYXJseSBub3QgWGVuIHN0eWxlLgoKPiBAQCAtMTM5
LDE1ICsxNDEsMTggQEAgaW50IChzdHJjbXApKGNvbnN0IGNoYXIgKmNzLCBjb25zdCBjaGFyICpj
dCkKPiAgICovCj4gIGludCAoc3RybmNtcCkoY29uc3QgY2hhciAqY3MsIGNvbnN0IGNoYXIgKmN0
LCBzaXplX3QgY291bnQpCj4gIHsKPiAtCXJlZ2lzdGVyIHNpZ25lZCBjaGFyIF9fcmVzID0gMDsK
PiArICAgIGZvciAoIDsgY291bnQ7IGNvdW50LS0gKQoKT2RkIGxvb3AgaGVhZGluZyB3aGVuICJ3
aGlsZSAoY291bnQtLSkiIHdvdWxkIGRvLCBzaW5jZSAiY291bnQiCmlzbid0IHVzZWQgZWxzZXdo
ZXJlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
