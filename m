From: Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v4 11/40] hw/xen: Use the IEC
 binary prefix definitions
Date: Wed, 13 Jun 2018 07:13:43 -0500
Message-ID: <a856ef80-fcab-0003-2bdd-89a1849fe857__3555.35892672396$1528891972$gmane$org@redhat.com>
References: <20180611011501.10235-1-f4bug@amsat.org>
 <20180611011501.10235-12-f4bug@amsat.org>
 <15d222dd-d2e9-4855-62c6-f89f2ee59c52@linaro.org>
 <76aa5170-1d18-8799-6ff1-a7c0dba0b489@redhat.com>
 <8537ca07-2645-6c2c-5945-a91da035b474@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=tiiw=i7=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1fT4eq-0005Dm-80
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 12:13:48 +0000
In-Reply-To: <8537ca07-2645-6c2c-5945-a91da035b474@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "open list:Block layer core" <qemu-block@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, "open list:X86" <xen-devel@lists.xenproject.org>, Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTIvMjAxOCAwNDoxMCBQTSwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6Cj4+IFNvIHRo
ZXJlJ3MgdHJhZGVvZmZzIGVpdGhlciB3YXksIGFuZCB5b3UgYXQgbGVhc3QgbmVlZCB0byBkb2N1
bWVudCBpbiB5b3VyCj4+IGNvbW1pdCBtZXNzYWdlcyB3aGF0IGF1ZGl0aW5nIHlvdSBoYXZlIGRv
bmUgdGhhdCBhbnkgdHlwZSBjaGFuZ2VzIGludHJvZHVjZWQgYnkKPj4geW91ciBjaGFuZ2VzIGFy
ZSBzYWZlLgo+IAo+IEknbSBtb3JlIGNvbmNlcm5lZCBhYm91dCB1bm5lY2Vzc2FyeSBvciB1bmlu
dGVuZGVkIHNpZ25lZCB2cyB1bnNpZ25lZCBjaGFuZ2VzCj4gdGhhbiBJIGFtIGFib3V0IHdpZHRo
LiAgQnV0IGlmIHdlJ3JlIGdvaW5nIHRvIGZvcmNlIGEgNjQtYml0IHR5cGUsIHVzZQo+IChpbnQ2
NF90KTEgbm90IDFMTC4gIFRoYXQgd2F5IHRoZSB0eXBlIHdpbGwgbWF0Y2ggdGhlIGV4aXN0aW5n
IFBSSWQ2NCBwcmludGYKPiBtYXJrdXAuCgpPciBzcGVsbCBpdCBVSU5UNjRfQygxKSBpZiB5b3Ug
ZG9uJ3Qgd2FudCBhIGNhc3QuCgotLSAKRXJpYyBCbGFrZSwgUHJpbmNpcGFsIFNvZnR3YXJlIEVu
Z2luZWVyClJlZCBIYXQsIEluYy4gICAgICAgICAgICsxLTkxOS0zMDEtMzI2NgpWaXJ0dWFsaXph
dGlvbjogIHFlbXUub3JnIHwgbGlidmlydC5vcmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
