From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 2/6] block: don't merge adjacent bvecs to
 one segment in bio blk_queue_split
Date: Mon, 11 Mar 2019 15:58:55 -0400
Message-ID: <20190311195855.GB17160@dhcp-burlington7-2nd-B-east-10-152-55-162.usdhcp.oraclecorp.com>
References: <20190309013737.27741-1-ming.lei@redhat.com>
 <20190309013737.27741-3-ming.lei@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=126k=RO=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1h3R4y-0003jJ-UH
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 19:59:20 +0000
Content-Disposition: inline
In-Reply-To: <20190309013737.27741-3-ming.lei@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ming Lei <ming.lei@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, Juergen Gross <jgross@suse.com>, Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, Omar Sandoval <osandov@fb.com>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBNYXIgMDksIDIwMTkgYXQgMDk6Mzc6MzNBTSArMDgwMCwgTWluZyBMZWkgd3JvdGU6
Cj4gRm9yIG5vcm1hbCBmaWxlc3lzdGVtIElPLCBlYWNoIHBhZ2UgaXMgYWRkZWQgdmlhIGJsa19h
ZGRfcGFnZSgpLAo+IGluIHdoaWNoIGJ2ZWMocGFnZSkgbWVyZ2UgaGFzIGJlZW4gaGFuZGxlZCBh
bHJlYWR5LCBhbmQgYmFzaWNhbGx5Cj4gbm90IHBvc3NpYmxlIHRvIG1lcmdlIHR3byBhZGphY2Vu
dCBidmVjcyBpbiBvbmUgYmlvLgo+IAo+IFNvIG5vdCB0cnkgdG8gbWVyZ2UgdHdvIGFkamFjZW50
IGJ2ZWNzIGluIGJsa19xdWV1ZV9zcGxpdCgpLCBhbHNvIGFkZAo+IGNoZWNrIGlmIG9uZSBwYWdl
IGlzIG1lcmdlYWJsZSB0byBjdXJyZW50IGJ2ZWMgaW4gYmlvX2FkZF9wYWdlKCkgZm9yCj4gYXZv
aWRpbmcgdG8gYnJlYWsgWEVOLgo+IAo+IENjOiByaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zz
a3lAb3JhY2xlLmNvbT4KPiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IENj
OiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBDYzogT21hciBTYW5kb3ZhbCA8b3Nh
bmRvdkBmYi5jb20+Cj4gQ2M6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IFNpZ25l
ZC1vZmYtYnk6IE1pbmcgTGVpIDxtaW5nLmxlaUByZWRoYXQuY29tPgo+IC0tLQo+ICBibG9jay9i
aW8uYyAgICAgICB8ICAyICsrCj4gIGJsb2NrL2Jsay1tZXJnZS5jIHwgMTcgLS0tLS0tLS0tLS0t
LS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9ibG9jay9iaW8uYyBiL2Jsb2NrL2Jpby5jCj4gaW5kZXggNzFh
NzhkOWZiOGI3Li5kOGY0ODE4ODkzN2MgMTAwNjQ0Cj4gLS0tIGEvYmxvY2svYmlvLmMKPiArKysg
Yi9ibG9jay9iaW8uYwo+IEBAIC03NzYsNiArNzc2LDggQEAgYm9vbCBfX2Jpb190cnlfbWVyZ2Vf
cGFnZShzdHJ1Y3QgYmlvICpiaW8sIHN0cnVjdCBwYWdlICpwYWdlLAo+ICAKPiAgCQlpZiAodmVj
X2VuZF9hZGRyICsgMSAhPSBwYWdlX2FkZHIgKyBvZmYpCj4gIAkJCXJldHVybiBmYWxzZTsKPiAr
CQlpZiAoeGVuX2RvbWFpbigpICYmICF4ZW5fYmlvdmVjX3BoeXNfbWVyZ2VhYmxlKGJ2LCBwYWdl
KSkKPiArCQkJcmV0dXJuIGZhbHNlOwo+ICAJCWlmIChzYW1lX3BhZ2UgJiYgKHZlY19lbmRfYWRk
ciAmIFBBR0VfTUFTSykgIT0gcGFnZV9hZGRyKQo+ICAJCQlyZXR1cm4gZmFsc2U7Cj4gIAoKUmV2
aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
