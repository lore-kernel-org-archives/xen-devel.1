From: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/7] Tracing patches
Date: Mon, 25 Mar 2019 18:09:00 +0000
Message-ID: <CAFEAcA8vaS3u5wetjpmmaVQRKmVWK3+csQWUMAPd4DVcoExwaA@mail.gmail.com>
References: <20190325155857.10661-1-stefanha@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SZ5F=R4=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1h8U25-0004uY-QT
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 18:09:13 +0000
Received: by mail-oi1-x244.google.com with SMTP id v7so7734097oie.8
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2019 11:09:11 -0700 (PDT)
In-Reply-To: <20190325155857.10661-1-stefanha@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Fam Zheng <fam@euphon.net>, kvm-devel <kvm@vger.kernel.org>, David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, QEMU Developers <qemu-devel@nongnu.org>, Michael Roth <mdroth@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "open list:X86" <xen-devel@lists.xenproject.org>, Qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>, Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>, "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@re>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAyNSBNYXIgMjAxOSBhdCAxNTo1OSwgU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUBy
ZWRoYXQuY29tPiB3cm90ZToKPgo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQg
ZDk3YTM5ZDkwM2ZlMzNjNDViZTgzYWM2OTQzYTJmODJhMzY0OWExMToKPgo+ICAgTWVyZ2UgcmVt
b3RlLXRyYWNraW5nIGJyYW5jaCAncmVtb3Rlcy9laGFia29zdC90YWdzL3g4Ni1uZXh0LXB1bGwt
cmVxdWVzdCcgaW50byBzdGFnaW5nICgyMDE5LTAzLTIyIDA5OjM3OjM4ICswMDAwKQo+Cj4gYXJl
IGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4KPiAgIGdpdDovL2dpdGh1Yi5j
b20vc3RlZmFuaGEvcWVtdS5naXQgdGFncy90cmFjaW5nLXB1bGwtcmVxdWVzdAo+Cj4gZm9yIHlv
dSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGRlYzk3NzYwNDllMzJkNmM4MzAxMjdiMjg2NTMwYzVm
NTMyNjdlZmY6Cj4KPiAgIHRyYWNlLWV2ZW50czogRml4IGF0dHJpYnV0aW9uIG9mIHRyYWNlIHBv
aW50cyB0byBzb3VyY2UgKDIwMTktMDMtMjIgMTY6MTg6MDcgKzAwMDApCj4KPiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
UHVsbCByZXF1ZXN0Cj4KPiBDb21waWxhdGlvbiBmaXhlcyBhbmQgY2xlYW51cHMgZm9yIFFFTVUg
NC4wLjAuCj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4KCkFwcGxpZWQsIHRoYW5rcy4KClBsZWFzZSB1cGRhdGUgdGhl
IGNoYW5nZWxvZyBhdCBodHRwczovL3dpa2kucWVtdS5vcmcvQ2hhbmdlTG9nLzQuMApmb3IgYW55
IHVzZXItdmlzaWJsZSBjaGFuZ2VzLgoKLS0gUE1NCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
