From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH 03/25] argo: introduce the argo_message_op
 hypercall boilerplate
Date: Wed, 19 Dec 2018 21:13:43 -0800
Message-ID: <CACMJ4GZUoE8mrvkjb+kZknQ_OVjQA3v1BJnAt8ZEmgDkew4fTA@mail.gmail.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-4-git-send-email-christopher.w.clark@gmail.com>
 <fc376b38bb6e46099f047b480c9c19cf@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SZmS=O5=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gZqek-0006WI-4s
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 05:13:58 +0000
Received: by mail-lf1-x132.google.com with SMTP id v5so335478lfe.7
 for <xen-devel@lists.xenproject.org>; Wed, 19 Dec 2018 21:13:56 -0800 (PST)
In-Reply-To: <fc376b38bb6e46099f047b480c9c19cf@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <voreekf@madingley.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBEZWMgNCwgMjAxOCBhdCAxOjQ0IEFNIFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50
QGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4g
RnJvbTogQ2hyaXN0b3BoZXIgQ2xhcmsgW21haWx0bzpjaHJpc3RvcGhlci53LmNsYXJrQGdtYWls
LmNvbV0KPiA+IFNlbnQ6IDAxIERlY2VtYmVyIDIwMTggMDE6MzMKPiA+IFRvOiB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKPiA+IFN1YmplY3Q6IFtQQVRDSCAwMy8yNV0gYXJnbzogaW50
cm9kdWNlIHRoZSBhcmdvX21lc3NhZ2Vfb3AgaHlwZXJjYWxsCj4gPiBib2lsZXJwbGF0ZQo+ID4K
PiA+IFByZXNlbmNlIGlzIGdhdGVkIHVwb24gQ09ORklHX0FSR08uCj4gPgo+ID4gUmVnaXN0ZXJz
IHRoZSBoeXBlcmNhbGwgcHJldmlvdXNseSByZXNlcnZlZCBmb3IgdGhpcy4KPiA+IFRha2VzIDUg
YXJndW1lbnRzLCBkb2VzIG5vdGhpbmcgYW5kIHJldHVybnMgLUVOT1NZUy4KPiA+Cj4gPiBXaWxs
IGJlIGF2b2lkaW5nIGEgY29tcGF0IEFCSSBieSB1c2luZyBmaXhlZC1zaXplIHR5cGVzIGluIGh5
cGVyY2FsbCBvcHMuCj4KPiBZb3UgYXBwZWFyIHRvIGJlIHVzaW5nIGhhbmRsZXMsIHNvIHdpbGwg
eW91IG5vdCBuZWVkIGNvbXBhdCBjb2RlIHRvIGRlYWwgd2l0aCB0aG9zZT8KCk5vLiBUaGUgc3Ry
dWN0dXJlcyB0aGF0IHRoZSBoYW5kbGVzIHJlZmVyIHRvIGFyZSBleGFjdGx5IHRoZSBzYW1lIG9u
CmJvdGggMzIgYW5kIDY0IGJpdCwgc28gdGhlIG1lbW9yeSBhY2Nlc3Mgb3BlcmF0aW9ucyB0aGF0
IHdvcmsgd2l0aCB0aGUKaGFuZGxlIERUUlQuCgpDb21tdW5pY2F0aW9uIGhhcyBiZWVuIHRlc3Rl
ZCBhbmQgaXMgd29ya2luZyBmaW5lLCBlZy4gYmV0d2VlbiBhCmNsaWVudCBpbiBhIDMyLWJpdCBn
dWVzdCBhbmQgc2VydmVyIGluIGEgNjQtYml0IFZNLgoKQ2hyaXN0b3BoZXIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
