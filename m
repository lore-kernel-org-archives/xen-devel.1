From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/5] xen/bitmap: fix bitmap_fill with
 zero-sized bitmap
Date: Mon, 6 May 2019 16:19:26 +0100
Message-ID: <87233032-658b-1c91-36eb-a0de3475e2f9@citrix.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <e54979f9ce16c254c78e4a48e3e5c0eb223f6dac.1557154206.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Pjh=TG=citrix.com=prvs=022dda640=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hNfOs-0006Kh-6H
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 15:19:30 +0000
In-Reply-To: <e54979f9ce16c254c78e4a48e3e5c0eb223f6dac.1557154206.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDUvMjAxOSAxNTo1MCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+
IFdoZW4gYml0bWFwX2ZpbGwoLi4uLCAwKSBpcyBjYWxsZWQsIGRvIG5vdCB0cnkgdG8gd3JpdGUg
YW55dGhpbmcuIEJlZm9yZQo+IHRoaXMgcGF0Y2gsIGl0IHRyaWVkIHRvIHdyaXRlIGFsbW9zdCBM
T05HX01BWCwgc3VyZWx5IG92ZXJ3cml0aW5nCj4gc29tZXRoaW5nLgo+Cj4gU2lnbmVkLW9mZi1i
eTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3Ns
YWIuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CgpJdCBsb29rcyBsaWtlIGFsbCBvdGhlciBvcGVyYXRpb25zIGRvIGNvcGUgY29ycmVj
dGx5IHdpdGggbmJpdHMgYmVpbmcgMC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
