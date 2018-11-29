From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [ARM] gvirt_to_maddr fails when DomU is created
Date: Thu, 29 Nov 2018 03:12:26 -0700
Message-ID: <5BFFBB8A02000078002011C2@prv1-mh.provo.novell.com>
References: <CAOcqxo3MTA0iSAD2m5P87+YBwv_d5_-RHSEX0uuwFwHAC0dVZg@mail.gmail.com>
 <2d3b870d-eb6e-d70c-0700-c6982354a0f1@arm.com>
 <e26ceefe-9f47-95d0-98a9-c84238d00e9f@citrix.com>
 <5BFFB3CD020000780020115A@prv1-mh.provo.novell.com>
 <6de36a91-858d-8a46-fda0-3982588e72ae@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=suqh=OI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gSJJ9-0000mA-JQ
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 10:12:31 +0000
In-Reply-To: <6de36a91-858d-8a46-fda0-3982588e72ae@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, vlad.babchuk@gmail.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjExLjE4IGF0IDExOjAzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gRnVydGhlcm1vcmUsIGxvb2tpbmcgYXQgdGhlIGNvbnRlbnQgaGVsZCBpbiB0aGUgcnVu
c3RhdGUgYXJlYSwgd2hhdCBkbwo+IGd1ZXN0cyBhY3R1YWxseSB1c2UgdGhlIGluZm9ybWF0aW9u
IGZvcj8gIEl0IGxvb2tzIGxpa2UgaXQgaXMgb2YKPiBtYXJnaW5hbCB1c2UgZm9yIGRpYWdub3N0
aWNzIHdpdGhpbiB0aGUgZ3Vlc3QuCgpDb3JyZWN0IHN0ZWFsIHRpbWUgYWNjb3VudGluZywgYXQg
dGhlIHZlcnkgbGVhc3QsIGRlcGVuZHMgb24gdGhpcwppaXJjLiBTdGVhbCB0aW1lIGFjY291bnRp
bmcgYmVpbmcgd3JvbmcgaGFzIGxlYWQgdG8gbXVsdGlwbGUgc3VwcG9ydApjYWxscyBoZXJlIGlu
IHRoZSBwYXN0LCBzbyBJIGRvbid0IHRoaW5rIEknZCBzdWJzY3JpYmUgdG8gdGhlICJtYXJnaW5h
bCIKcGFydC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
