From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH] qemu: include generated files with <> and
 not ""
Date: Tue, 20 Mar 2018 16:40:48 +0000
Message-ID: <20180320164048.GB4530@redhat.com>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
 <da3457a0-7f24-4759-7d98-9b2fdc87e87c@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9iii=gk=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1eyKKK-0002Fw-VU
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 16:41:33 +0000
Content-Disposition: inline
In-Reply-To: <da3457a0-7f24-4759-7d98-9b2fdc87e87c@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Eric Blake <eblake@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jiri Pirko <jiri@resnulli.us>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, Yongbok Kim <yongbok.kim@mips.com>, Michael Roth <mdroth@linux.vnet.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjAsIDIwMTggYXQgMTE6MTI6MDBBTSAtMDUwMCwgRXJpYyBCbGFrZSB3cm90
ZToKPiBPbiAwMy8xOS8yMDE4IDA4OjU0IFBNLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4g
PiBRRU1VIGNvZGluZyBzdHlsZSBhdCB0aGUgbW9tZW50IGFza3MgZm9yIGFsbCBub24tc3lzdGVt
Cj4gPiBpbmNsdWRlIGZpbGVzIHRvIGJlIHVzZWQgd2l0aCAjaW5jbHVkZSAiZm9vLmgiLgo+IAo+
IFtJJ20gcmVwbHlpbmcgd2l0aG91dCBoYXZpbmcgcmVhZCB0aGUgcmVzdCBvZiB0aGUgdGhyZWFk
LCBzbyBiZWFyIHdpdGggbWUgaWYKPiBJIHJlcGVhdCBzb21lIG9mIHRoZSBvdGhlciBjb21tZW50
cyB0aGF0IGhhdmUgYWxyZWFkeSBiZWVuIG1hZGVdCj4gCj4gQW5kIE1hcmt1cyBldmVuIGp1c3Qg
ZGlkIGEgY2xlYW51cCBhbG9uZyB0aG9zZSBsaW5lcy4KPiAKPiA+IEhvd2V2ZXIgdGhpcyBydWxl
IGFjdHVhbGx5IGRvZXMgbm90IG1ha2Ugc2Vuc2UgYW5kCj4gPiBjcmVhdGVzIGlzc3VlcyBmb3Ig
d2hlbiB0aGUgaW5jbHVkZWQgZmlsZSBpcyBnZW5lcmF0ZWQuCj4gPiAKPiA+IEluIEMsIGluY2x1
ZGUgImZpbGUiIG1lYW5zIGxvb2sgaW4gY3VycmVudCBkaXJlY3RvcnksCj4gPiB0aGVuIG9uIGlu
Y2x1ZGUgc2VhcmNoIHBhdGguIEN1cnJlbnQgZGlyZWN0b3J5IGhlcmUKPiA+IG1lYW5zIHRoZSBz
b3VyY2UgZmlsZSBkaXJlY3RvcnkuCj4gPiBCeSBjb21wYXJpc29uIGluY2x1ZGUgPGZpbGU+IG1l
YW5zIGxvb2sgb24gaW5jbHVkZSBzZWFyY2ggcGF0aC4KPiAKPiBJdCdzIGFsc28gbmljZSB3aGVu
ICJmaWxlIiBtZWFucyBmaWxlIGJlbG9uZ2luZyB0byBvdXIgcHJvamVjdCwgYW5kIDxmaWxlPgo+
IG1lYW5zIDNyZC1wYXJ0eSBmaWxlLiAgU28gd2UgaGF2ZSB0byBjaG9vc2Ugd2hpY2ggc2VtYW50
aWNzIGFyZSBlYXNpZXI7Cj4gcGVyaGFwcyBiZXR0ZXIgTWFrZWZpbGUgcnVsZXMgdGhhdCBwcmV2
ZW50IHVzIGZyb20gc2VlaW5nIHN0YWxlIGZpbGVzIGlzIGEKPiBiZXR0ZXIgc29sdXRpb24gdGhh
biBmaWd1cmluZyBvdXQgd2hpY2ggZmlsZXMgYXJlIGdlbmVyYXRlZC4KClRoYXQncyB3aGF0IEkn
dmUgYXR0ZW1wdGVkIGhlcmU6CgogIGh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwv
cWVtdS1kZXZlbC8yMDE4LTAzL21zZzA1NDIxLmh0bWwKCgpSZWdhcmRzLApEYW5pZWwKLS0gCnw6
IGh0dHBzOi8vYmVycmFuZ2UuY29tICAgICAgLW8tICAgIGh0dHBzOi8vd3d3LmZsaWNrci5jb20v
cGhvdG9zL2RiZXJyYW5nZSA6fAp8OiBodHRwczovL2xpYnZpcnQub3JnICAgICAgICAgLW8tICAg
ICAgICAgICAgaHR0cHM6Ly9mc3RvcDEzOC5iZXJyYW5nZS5jb20gOnwKfDogaHR0cHM6Ly9lbnRh
bmdsZS1waG90by5vcmcgICAgLW8tICAgIGh0dHBzOi8vd3d3Lmluc3RhZ3JhbS5jb20vZGJlcnJh
bmdlIDp8CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
