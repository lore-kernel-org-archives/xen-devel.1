From: Rich Persaud <persaur@gmail.com>
Subject: Re: [VOTE] tagging for operational messages sent to
 xen-devel@ (was Re: Xen 4.13 Development Update)
Date: Thu, 25 Apr 2019 18:59:44 -0400
Message-ID: <DB7FD117-5AFE-4D4E-8BA6-A08475E48923@gmail.com>
References: <6DD29A1E-62F8-45C3-B381-04DCEA350C02@citrix.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gqxz=S3=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1hJnLH-000588-Vq
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 22:59:48 +0000
Received: by mail-it1-x12e.google.com with SMTP id v8so3149245itf.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2019 15:59:46 -0700 (PDT)
In-Reply-To: <6DD29A1E-62F8-45C3-B381-04DCEA350C02@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Luwei Kang <luwei.kang@intel.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <Paul.Durrant@citrix.com>, "committers@xenproject.org" <committers@xenproject.org>, Jan Beulich <JBeulich@suse.com>, Pu Wen <puwen@hygon.cn>, xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Chao Gao <chao.gao@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiBPbiBBcHIgMjUsIDIwMTksIGF0IDEyOjM2LCBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNpdHJp
eC5jb20+IHdyb3RlOgo+IAo+IEFscmlnaHQsCj4gCj4gdGhlcmUgd2FzIGEgbGVuZ3RoeSBkaXNj
dXNzaW9uIG9uIHRoaXMgdG9waWMgb24gSVJDIC0gbG9nIGF0dGFjaGVkLiBUaGUgY29uc2Vuc3Vz
IGFwcGVhcnMgdG8gYmUgdG8gdXNlIENhbm9uaWNhbCBtZXNzYWdlcyB3aXRoIGEgQ0FQSVRBTElT
RUQgdGFnLiBFLmcuICJbVEFHXSBYZW4gNC4xMyBEZXZlbG9wbWVudCBVcGRhdGUiLgo+IAo+IFRo
ZSBvcHRpb25zIHdoaWNoIHNlZW1lZCB0byBoYXZlIGxlYXN0IG9iamVjdGlvbnMgYXJlCj4gMTog
W0FOTk9VTkNFXQo+IDI6IFtPUEVSQVRJT05TXSAKPiAzOiBbUFJPQ0VTU10KPiAKPiBBbmQgdGhh
dCB3ZSBzaG91bGQgdXNlIHRoZXNlIGZvciBvdGhlciBtZXNzYWdlcy9hbm5vdW5jZW1lbnRzIHJl
bGF0ZWQgdG8gdGhlIG9wZXJhdGlvbiBvZiBYZW4gUHJvamVjdCBEZXZlbG9wbWVudC4KCk9uIG1v
YmlsZSBkZXZpY2VzLCBzaG9ydGVyIHN1YmplY3RzIGFyZSBiZXR0ZXIuICBBIFt4ZW4tZGV2ZWxd
IGVtYWlsIGFscmVhZHkgaGFzIG9uZSAxMS1jaGFyYWN0ZXIgdGFnLiBTaW5jZSB0YWdzIGFyZSBp
biBDQVBJVEFMUywgYWJicmV2aWF0ZWQgdGFncyA9IGxlc3MgU0hPdXRpbmcuCgo+IFtEaXppZXRd
IE9ubHkgYmVjYXVzZSB3ZSBjb3B5IGV2ZXJ5dGhpbmcgZnJvbSAtYW5ub3VuY2UgdG8gLWRldmVs
LgoKU29tZSBtYWlsaW5nIGxpc3RzIHVzZSBbQU5OXSBmb3IgYW5ub3VuY2VtZW50cy4gIEVtYWls
IG1pcnJvcmVkIHRvIHhlbi1kZXZlbCBmcm9tIC1hbm5vdW5jZSBjb3VsZCBwcmVmaXggdGhlIFtB
Tk5dIHRhZywgd2hpY2ggd291bGQgbm90IGJlIHVzZWQgZm9yIG5vbi1taXJyb3JlZCBlbWFpbCwg
c2luY2UgYWxsIGFubm91bmNlbWVudHMgd291bGQgYmUgZGlyZWN0ZWQgdG8gLWFubm91bmNlLgoK
PiBbZ3dkXSBCdXQgaW4gbXkgbWluZCwgdGhpbmdzIGxpa2UgUk0gdXBkYXRlcyAod2hpY2ggaGFw
cGVuIHByZXR0eSByZWd1bGFybHkpIGFuZCBzYXksIERldmVsb3BlciBTdW1taXQgYW5ub3VuY2Vt
ZW50cywgYXJlIGRpZmZlcmVudCB0aGluZ3MuCgpUaGUgbWVzc2FnZXMgd2hpY2ggcHJvbXB0ZWQg
dGhpcyBkaXNjdXNzaW9uIHdlcmUgcmVsYXRlZCB0byByZWxlYXNlIG1hbmFnZW1lbnQuICBUaGVz
ZSB3ZXJlIGNhbGxlZCBSTSBpbiB0aGUgSVJDIGRpc2N1c3Npb24sIHdoaWNoIHN1Z2dlc3RzIFtS
TV0gYXMgYSBwb3NzaWJsZSB0YWcuICBJdCdzIHF1aWNrIHRvIHR5cGUgYW5kIG5vbi1kaXN0cmFj
dGluZyB0byByZWFkLiAgVGhpcyB3b3VsZCBub3QgcHJlY2x1ZGUgb3RoZXIgdGFncyBmb3Igbm9u
IFtSTV0gbWVzc2FnZXMuCgpSaWNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
