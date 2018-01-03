From: "Alex Braunegg" <alex.braunegg@gmail.com>
Subject: Re: [BUG] kernel bug encountered at
	drivers/net/xen-netback/netback.c:430!
Date: Thu, 4 Jan 2018 05:43:03 +1100
Message-ID: <5a4d243d.4d78630a.2f9d0.62ad@mx.google.com>
References: <5a3ca8ee.4426620a.b956d.1799@mx.google.com>
 <352b0317-cfc5-1ef4-fbd0-2b2879f9712e@suse.com>
 <5a3d6c93.886f620a.2522d.c2fb@mx.google.com>
 <23eb0f3f-590d-f03a-f971-65e86c52fbe4@ark-net.org>
 <5a4546b1.55da620a.5c435.4b4b@mx.google.com>
 <3f860d32831940e7aa40d97979155b6e@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ju66=d6=gmail.com=alex.braunegg@srs-us1.protection.inumbo.net>)
 id 1eWo0P-0006qS-DV
 for xen-devel@lists.xenproject.org; Wed, 03 Jan 2018 18:43:13 +0000
Received: by mail-pl0-x229.google.com with SMTP id 1so1754344plv.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jan 2018 10:43:11 -0800 (PST)
In-Reply-To: <3f860d32831940e7aa40d97979155b6e@AMSPEX02CL03.citrite.net>
Content-Language: en-au
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Paul Durrant' <Paul.Durrant@citrix.com>, 'Michael Collins' <mike@ark-net.org>, 'Juergen Gross' <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: 'Wei Liu' <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBIb3cgZWFzeSBpcyBpdCB0byB0cmlnZ2VyIHRoaXM/IEknbSBhc3N1bWluZywgZnJvbSB0aGUg
b3JpZ2luYWwgZGVzY3JpcHRpb24sIHRoYXQgSSBjYW4gcHJvYmFibHkgdHJpZ2dlciBpdCBieSBm
b3JjaWJseSB0ZXJtaW5hdGluZyBhIHJ1bm5pbmcgZG9tYWluIGFuZCB0aGVuIHRyeWluZyB0byBy
ZXN0YXJ0IGl0LgoKRm9yIG1lIHRoZSB0cmlnZ2VyIHdhcyBqdXN0IGhhdmluZyAyIFZNJ3MgcnVu
bmluZyBhbmQgdGhlbiB3aXRoaW4gMjQgaHIncyBvbmUgd291bGQgY3Jhc2ggd2l0aCB0aGUgZGVi
dWcgZGF0YSBzZW50IHRvIGNvbnNvbGUgLyBkbWVzZy4gSSBkaWRu4oCZdCBoYXZlIHRvIGRvIGFu
eXRoaW5nIHNwZWNpYWwgdG8gdHJpZ2dlciBpdCAtIG5vciBkaWQgSSB0cnkgLyBhdHRlbXB0IHRv
IHRyaWdnZXIgaXQuCgpXaGVuIGF0dGVtcHRpbmcgdG8gcmVzdGFydCB0aGUgY3Jhc2hlZCBWTSAo
dXNpbmcgeGwpIC0gdGhhdOKAmXMgd2hlbiBJIGdvdCB0aGUgYWRkaXRpb25hbCB4bCBtZXNzYWdl
cyAmIHRoZSBzZXJ2ZXIgcmVib290ZWQuCgo+IFRoaXMgYnJlYWtzIGNvbXBpbGF0aW9uIG9mIHhl
bi1uZXRiYWNrIHdpdGggb2xkZXIgY29tcGlsZXJzLgo+ICAgID5Gcm9tIGtidWlsZCBib3Qgd2l0
aCBnY2MtNC40Ljc6CgpNeSBYZW4gdmVyc2lvbiAoYW5kIGFsbCBwYWNrYWdlcyBvdGhlciBwYWNr
YWdlcyBpbmNsdWRpbmcgdGhlIGtlcm5lbCkgYXJlIGJ1aWx0IC8gcmVidWlsdCB1c2luZyBnY2Mg
NC42LjIgc28gSSBkb27igJl0IHRoaW5rIEkgYW0gaGl0dGluZyB0aGlzIGdjYyBpc3N1ZSB0aGF0
IHRoZSBwYXRjaCBmaXhlZC4KCkJlc3QgcmVnYXJkcywKCkFsZXgKCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
