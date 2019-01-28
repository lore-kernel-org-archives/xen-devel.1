From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 for-4.12] gic-vgic: fix an assert
 condition
Date: Mon, 28 Jan 2019 10:42:28 +0000
Message-ID: <83316cca-ebde-5653-36c5-e0daa25be0ad@arm.com>
References: <1548435962-29797-1-git-send-email-andrii.anisov@gmail.com>
 <20190128094258.4136b5aa@donnerap.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CKwR=QE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1go4N8-0004ck-7m
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 10:42:34 +0000
In-Reply-To: <20190128094258.4136b5aa@donnerap.cambridge.arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@arm.com>, Andrii Anisov <andrii.anisov@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Stefan Nuernberger <snu@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMS8yOC8xOSA5OjQyIEFNLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPiBPbiBGcmksIDI1IEph
biAyMDE5IDE5OjA2OjAyICswMjAwCj4gQW5kcmlpIEFuaXNvdiA8YW5kcmlpLmFuaXNvdkBnbWFp
bC5jb20+IHdyb3RlOgo+IAo+PiBGcm9tOiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVw
YW0uY29tPgo+Pgo+PiBDdXJyZW50bHksIHRoYXQgYXNzZXJ0IGNvbmRpdGlvbiBkb2VzIG5vdCBj
b3JyZXNwb25kIHRvIGEgY29tbWVudAo+PiBhYm92ZSBhbmQgbWFrZXMgYXNzZXJ0aW9uIGZhaWxl
ZCBvbiBIVyBJUlEgZGlzY29ubmVjdGlvbi4KPj4gRml4IHRoZSBjb25kaXRpb24gc28gaXQgY29y
cmVzcG9uZHMgdG8gdGhlIGNvbW1lbnQgYW5kIGFsbG93cyBJUlEKPj4gZGlzY29ubmVjdGlvbiBv
biBkZWJ1ZyBidWlsZHMuCj4+Cj4+IEZpeGVzOiBlYzJhMmYxICgiQVJNOiBWR0lDOiBmYWN0b3Ig
b3V0IHZnaWNfY29ubmVjdF9od19pcnEoKSIpCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJpaSBBbmlz
b3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cj4+IFN1Z2dlc3RlZC1ieTogU3RlZmFuIE51ZXJu
YmVyZ2VyIDxzbnVAYW1hem9uLmRlPgo+IAo+IFJldmlld2VkLWJ5OiBBbmRyZSBQcnp5d2FyYSA8
YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT4KCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPgoKSnVlcmdlbiwgY2FuIHdlIGdldCBhIHJlbGVhc2UtYWNrIGZvciB0aGlz
IHBhdGNoPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
