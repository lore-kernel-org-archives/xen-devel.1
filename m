From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 4/4] xen/x86: Allow stubdom access to irq
 created for msi.
Date: Thu, 17 Jan 2019 04:52:42 -0700
Message-ID: <5C406C8A020000780020EA27@prv1-mh.provo.novell.com>
References: <cover.f56cb3033143af6e9a0aeeaf33eb912fa5761983.1547566486.git-series.marmarek@invisiblethingslab.com>
 <8ea00e9347ae7859a37ea421e658263a44a375fb.1547566486.git-series.marmarek@invisiblethingslab.com>
 <20190116092129.jz2cts5pwd5ckh34@mac> <20190116105218.GM1205@mail-itl>
 <20190116122004.byvr2bttwkttofqs@mac> <20190116134914.GN1205@mail-itl>
 <20190117085746.rg2vbyh3ga4aru6f@mac>
 <FB0C9893020000480063616D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SW9P=PZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gk6Dz-00011Q-Bq
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 11:52:43 +0000
In-Reply-To: <FB0C9893020000480063616D@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjAxLjE5IGF0IDA5OjU3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFdoaWxlIG5vdCBhZ2FpbnN0IHVzaW5nIHBoeXNkZXZvcCBpZiB3ZSBhZ3JlZSB0aGF0IGEgbmV3
IGh5cGVyY2FsbCBpcwo+IHRoZSB3YXkgdG8gZ28sIEkgd291bGQgcHJlZmVyIGEgZG9tY3RsIGJl
Y2F1c2UgdGhpcyBoeXBlcmNhbGwgd291bGQKPiBvbmx5IGJlIHVzZWQgYnkgdG9vbHN0YWNrIGNv
bXBvbmVudHMsIGFuZCB0aHVzIGRvZXNuJ3QgbmVlZCB0byBiZQo+IGFkZGVkIHRvIHRoZSBwdWJs
aWMgc3RhYmxlIEFCSSBhdmFpbGFibGUgdG8gYWxsIGd1ZXN0cywgZXZlbiBpZiB0aGUKPiBmdW5j
dGlvbmFsaXR5IGlzIGFjdHVhbGx5IGxpbWl0ZWQgdG8gc3R1YmRvbWFpbnMuCgpCdXQgYSBuZXcg
c3ViLW9wIGRvZXNuJ3QgbmVlZCB0byBiZSBwYXJ0IG9mIHRoZSBzdGFibGUgQUJJLgpTZWUgaG93
IGUuZy4gdmFyaW91cyBvZiB0aGUgbWVtb3J5IHN1Yi1vcHMgYXJlIHJlc3RyaWN0ZWQgdG8KYmUg
dXNlZCBieSB0aGUgdG9vbCBzdGFjaywgYW5kIGhlbmNlIG5vdCByZXF1aXJlZCB0byByZW1haW4K
dW5jaGFuZ2VkLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
