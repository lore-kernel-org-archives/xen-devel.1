From: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] qemu: include generated files with <> and
 not ""
Date: Tue, 20 Mar 2018 10:01:24 +0000
Message-ID: <CAFEAcA-eoyPokMLqUBcHvEgp=GQnODv3r3A_9LRkc=8do6ea1A@mail.gmail.com>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
 <8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
 <20180320094406.GD4530@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gly6=gk=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1eyE5R-0007gG-Vm
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 10:01:46 +0000
Received: by mail-oi0-x244.google.com with SMTP id 23-v6so804358oir.11
 for <xen-devel@lists.xenproject.org>; Tue, 20 Mar 2018 03:01:45 -0700 (PDT)
In-Reply-To: <20180320094406.GD4530@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, QEMU Developers <qemu-devel@nongnu.org>, "Richard W.M. Jones" <rjones@redhat.com>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jiri Pirko <jiri@resnulli.us>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, Eric Blake <eblake@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhanghailiang <zhang.zhanghailiang@hu>
List-Id: xen-devel@lists.xenproject.org

T24gMjAgTWFyY2ggMjAxOCBhdCAwOTo0NCwgRGFuaWVsIFAuIEJlcnJhbmfDqSA8YmVycmFuZ2VA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4gV2UgY2FuIGZvbGxvdyB3aGF0IGF1dG9jb25mIGRvZXMsIGFu
ZCBhZGQgYSBjaGVjayB0byBjb25maWd1cmUgdG8gc2VlIGlmCj4gdGhlcmUgYXJlIGdlbmVyYXRl
ZCBmaWxlcyBsZWZ0IGluIHRoZSBzb3VyY2UgZGlyLCB3aGVuIGNvbmZpZ3VyaW5nIHdpdGgKPiBi
dWlsZGRpciAhPSBzcmNkaXIsIGFuZCBleGl0IHdpdGggZXJyb3IsIHRlbGxpbmcgdXNlciB0byBj
bGVhbiB0aGVpcgo+IHNyYyBkaXIgZmlyc3QuCgpXZSBhbHJlYWR5IGRvIHRoaXMgaW4gb3VyIG1h
a2VmaWxlLi4uaXQganVzdCBkb2Vzbid0IGNoZWNrIGV2ZXJ5CnNpbmdsZSBnZW5lcmF0ZWQgZmls
ZS4KCnRoYW5rcwotLSBQTU0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
