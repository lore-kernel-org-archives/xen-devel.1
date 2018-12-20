From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH] drm/xen-front: Make shmem backed display
 buffer coherent
Date: Thu, 20 Dec 2018 17:49:39 +0200
Message-ID: <f2cfadc7-2e0b-b63d-d094-d5339b0c85fe__45841.1480336965$1545320911$gmane$org@gmail.com>
References: <20181127103252.20994-1-andr2000@gmail.com>
 <17640791-5306-f7e4-8588-dd39c14e975b@tronnes.org>
 <20181220153646.GA22997@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZDzB=O5=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1ga0Zz-0002jR-Gg
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 15:49:43 +0000
Received: by mail-lj1-x243.google.com with SMTP id l15-v6so1988781lja.9
 for <xen-devel@lists.xenproject.org>; Thu, 20 Dec 2018 07:49:42 -0800 (PST)
In-Reply-To: <20181220153646.GA22997@infradead.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Hellwig <hch@infradead.org>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Cc: jgross@suse.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, daniel.vetter@intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMjAvMTggNTozNiBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24gVHVlLCBE
ZWMgMTgsIDIwMTggYXQgMDg6MjA6MjJQTSArMDEwMCwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+
Pj4gKwlpZiAoIWRtYV9tYXBfc2coZGV2LT5kZXYsIHhlbl9vYmotPnNndC0+c2dsLCB4ZW5fb2Jq
LT5zZ3QtPm5lbnRzLAo+Pj4gKwkJCURNQV9CSURJUkVDVElPTkFMKSkgewo+Pgo+PiBBcmUgeW91
IHVzaW5nIHRoZSBETUEgc3RyZWFtaW5nIEFQSSBhcyBhIHdheSB0byBmbHVzaCB0aGUgY2FjaGVz
Pwo+IFRoaXMgbG9va3MgcmF0aGVyIGJyb2tlbi4gIFBsZWFzZSBzZW5kIHRoZSB3aG9sZSBwYXRj
aCBzZXJpZXMgdG8KPiB0aGUgaW9tbXUgbGlzdCBmb3IgcHJvcGVyIHJldmlldy4KVGhpcyBpcyB0
aGUgb25seSBwYXRjaCBbMV0sIG5vIHNlcmllcy4gQW5kIGF0IHRoZSBtb21lbnQgSSB0aGluawp0
aGVyZSBpcyBub3RoaW5nIHRvIHJldmlldyBhcyBJIGFtIG5vdCBzdXJlIGhvdyB0byBkZWFsIHdp
dGggdGhvc2UKc2htZW0gcGFnZXM6IHRoaXMgcGF0Y2ggaXMgcmF0aGVyIHRvIHN0YXJ0IGEgZGlz
Y3Vzc2lvbiBvbiBob3cgc2htZW0KcGFnZXMgY2FuIGJlIGZsdXNoZWQgb24gQVJNICh0aGUgb25s
eSB3b3JrYXJvdW5kIEkgaGF2ZSBzbyBmYXIgaXMKaW4gdGhpcyBwYXRjaCB3aGljaCB1c2VzIERN
QSBBUEkpLiBUaGlzIGlzIHdoZXJlIEkgYW0gbG9va2luZyBmb3IKc29tZSBhZHZpY2UsIHNvIEkg
Y2FuIGltcGxlbWVudCB0aGUgcGF0Y2ggdGhlIHJpZ2h0IHdheS4KPj4gRG9lcyB0aGlzIG1lYW4g
dGhhdCBHRlBfVVNFUiBpc24ndCBtYWtpbmcgdGhlIGJ1ZmZlciBjb2hlcmVudD8KPiBIb3cgY291
bGQgR0ZQX1VTRVIgbWFrZSBtZW1vcnkgY29oZXJlbnQgaW4gYW55IHdheT8KSSBhbSBubyB3YXkg
YW4gZXhwZXJ0IGhlcmUsIGJ1dCBvdGhlciBEUk0gZHJpdmVycyBhbGxvY2F0ZSBidWZmZXJzCmZy
b20gc2htZW0gYW5kIHRoZW4gdXNlIERNQSBBUEkgWzJdLCBmb3IgZXhhbXBsZSBbM10KClsxXSBo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwNzAwMDg5LwpbMl0gaHR0cHM6Ly9l
bGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjQuMjAtcmM3L2lkZW50L2RybV9nZW1fZ2V0X3BhZ2Vz
ClszXSAKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjQuMjAtcmM3L3NvdXJjZS9k
cml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jI0wyNDgKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
