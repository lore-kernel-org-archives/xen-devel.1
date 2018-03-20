From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH] qemu: include generated files with <> and
 not ""
Date: Tue, 20 Mar 2018 10:27:19 +0000
Message-ID: <20180320102719.GF4530@redhat.com>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
 <8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
 <20180320094406.GD4530@redhat.com>
 <CAFEAcA-eoyPokMLqUBcHvEgp=GQnODv3r3A_9LRkc=8do6ea1A@mail.gmail.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9iii=gk=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1eyEUU-00013Y-Tc
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 10:27:38 +0000
Content-Disposition: inline
In-Reply-To: <CAFEAcA-eoyPokMLqUBcHvEgp=GQnODv3r3A_9LRkc=8do6ea1A@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, QEMU Developers <qemu-devel@nongnu.org>, "Richard W.M. Jones" <rjones@redhat.com>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jiri Pirko <jiri@resnulli.us>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, Eric Blake <eblake@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhanghailiang <zhang.zhanghailiang@hu>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjAsIDIwMTggYXQgMTA6MDE6MjRBTSArMDAwMCwgUGV0ZXIgTWF5ZGVsbCB3
cm90ZToKPiBPbiAyMCBNYXJjaCAyMDE4IGF0IDA5OjQ0LCBEYW5pZWwgUC4gQmVycmFuZ8OpIDxi
ZXJyYW5nZUByZWRoYXQuY29tPiB3cm90ZToKPiA+IFdlIGNhbiBmb2xsb3cgd2hhdCBhdXRvY29u
ZiBkb2VzLCBhbmQgYWRkIGEgY2hlY2sgdG8gY29uZmlndXJlIHRvIHNlZSBpZgo+ID4gdGhlcmUg
YXJlIGdlbmVyYXRlZCBmaWxlcyBsZWZ0IGluIHRoZSBzb3VyY2UgZGlyLCB3aGVuIGNvbmZpZ3Vy
aW5nIHdpdGgKPiA+IGJ1aWxkZGlyICE9IHNyY2RpciwgYW5kIGV4aXQgd2l0aCBlcnJvciwgdGVs
bGluZyB1c2VyIHRvIGNsZWFuIHRoZWlyCj4gPiBzcmMgZGlyIGZpcnN0Lgo+IAo+IFdlIGFscmVh
ZHkgZG8gdGhpcyBpbiBvdXIgbWFrZWZpbGUuLi5pdCBqdXN0IGRvZXNuJ3QgY2hlY2sgZXZlcnkK
PiBzaW5nbGUgZ2VuZXJhdGVkIGZpbGUuCgpBaCB5ZXMsIGluZGVlZDoKCiQgbWFrZQpNYWtlZmls
ZTo1OTogKioqIFRoaXMgaXMgYW4gb3V0IG9mIHRyZWUgYnVpbGQgYnV0IHlvdXIgc291cmNlIHRy
ZWUKKC9ob21lL2JlcnJhbmdlL3NyYy92aXJ0L3FlbXUpIHNlZW1zIHRvIGhhdmUgYmVlbiB1c2Vk
IGZvciBhbiBpbi10cmVlCmJ1aWxkLiBZb3UgY2FuIGZpeCB0aGlzIGJ5IHJ1bm5pbmcgIm1ha2Ug
ZGlzdGNsZWFuICYmIHJtIC1yZiAqLWxpbnV4LXVzZXIKICotc29mdG1tdSIgaW4geW91ciBzb3Vy
Y2UgdHJlZS4gIFN0b3AuCgoKSXQgaXMgY2hlY2tpbmcgZm9yIGV4aXN0YW5jZSBvZiBjb25maWct
aG9zdC5tYWsuCgpXZSBoYXZlIGEgY29udmVuaWVudCBsaXN0IG9mIGdlbmVyYXRlZCBmaWxlcyBp
biAkKEdFTkVSQVRFRF9GSUxFUyksIHNvCkkgd29uZGVyIGlmIHRoZXJlJ3MgYSBwcmFjdGljYWwg
d2F5IHRvIGNoZWNrIGFsbCBvZiB0aG9zZSB0b28uCgpSZWdhcmRzLApEYW5pZWwKLS0gCnw6IGh0
dHBzOi8vYmVycmFuZ2UuY29tICAgICAgLW8tICAgIGh0dHBzOi8vd3d3LmZsaWNrci5jb20vcGhv
dG9zL2RiZXJyYW5nZSA6fAp8OiBodHRwczovL2xpYnZpcnQub3JnICAgICAgICAgLW8tICAgICAg
ICAgICAgaHR0cHM6Ly9mc3RvcDEzOC5iZXJyYW5nZS5jb20gOnwKfDogaHR0cHM6Ly9lbnRhbmds
ZS1waG90by5vcmcgICAgLW8tICAgIGh0dHBzOi8vd3d3Lmluc3RhZ3JhbS5jb20vZGJlcnJhbmdl
IDp8CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
