From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 1/6] block: pass page to
 xen_biovec_phys_mergeable
Date: Mon, 11 Mar 2019 15:57:00 -0400
Message-ID: <20190311195700.GA17160@dhcp-burlington7-2nd-B-east-10-152-55-162.usdhcp.oraclecorp.com>
References: <20190309013737.27741-1-ming.lei@redhat.com>
 <20190309013737.27741-2-ming.lei@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=126k=RO=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1h3R3C-0003cV-M4
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 19:57:30 +0000
Content-Disposition: inline
In-Reply-To: <20190309013737.27741-2-ming.lei@redhat.com>
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

T24gU2F0LCBNYXIgMDksIDIwMTkgYXQgMDk6Mzc6MzJBTSArMDgwMCwgTWluZyBMZWkgd3JvdGU6
Cj4geGVuX2Jpb3ZlY19waHlzX21lcmdlYWJsZSgpIG9ubHkgbmVlZHMgLmJ2X3BhZ2Ugb2YgdGhl
IDJuZCBiaW8gYnZlYwo+IGZvciBjaGVja2luZyBpZiB0aGUgdHdvIGJ2ZWNzIGNhbiBiZSBtZXJn
ZWQsIHNvIHBhc3MgcGFnZSB0bwo+IHhlbl9iaW92ZWNfcGh5c19tZXJnZWFibGUoKSBkaXJlY3Rs
eS4KPiAKPiBObyBmdW5jdGlvbiBjaGFuZ2UuCj4gCj4gQ2M6IHJpcyBPc3Ryb3Zza3kgPGJvcmlz
Lm9zdHJvdnNreUBvcmFjbGUuY29tPgo+IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBPbWFyIFNhbmRv
dmFsIDxvc2FuZG92QGZiLmNvbT4KPiBDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
Cj4gU2lnbmVkLW9mZi1ieTogTWluZyBMZWkgPG1pbmcubGVpQHJlZGhhdC5jb20+CgoKUmV2aWV3
ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CiAgICAg
ICAgICAgICBeXgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
