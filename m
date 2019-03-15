From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC 07/55] x86/mm: add an end_of_loop label
 in map_pages_to_xen
Date: Fri, 15 Mar 2019 09:40:39 -0600
Message-ID: <5C8BC777020000780021F5EF@prv1-mh.provo.novell.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-8-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=64UD=RS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4oww-0003LV-9f
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 15:40:46 +0000
In-Reply-To: <20190207164456.9260-8-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAyLjE5IGF0IDE3OjQ0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
V2Ugd2lsbCBzb29uIG5lZWQgdG8gY2xlYW4gdXAgbWFwcGluZ3Mgd2hlbmV2ZXIgdGhlIG91dCBt
b3N0IGxvb3AgaXMKPiBlbmRlZC4gQWRkIGEgbmV3IGxhYmVsIGFuZCB0dXJuIHJlbGV2YW50IGNv
bnRpbnVlJ3MgaW50byBnb3RvJ3MuCgpUbyBiZSBob25lc3QsIEkgd2FzIG9uIHRoZSBlZGdlIG9m
IGFscmVhZHkgc3VnZ2VzdGluZyBsZXNzIHVzZQpvZiBnb3RvIGluIHRoZSBwcmV2aW91cyBwYXRj
aC4gVGhpcyBvbmUgZGVmaW5pdGVseSBnb2VzIHRvbyBmYXIKZm9yIG15IHRhc3RlIC0gSSBjYW4g
c29tZWhvdyBsaXZlIHdpdGggZ290by1zIHVzZWQgZm9yIGVycm9yCmhhbmRsaW5nLCBidXQgcGxl
YXNlIG5vdCBtdWNoIG1vcmUuIElzIHRoZXJlIHJlYWxseSBubyBiZXR0ZXIKd2F5PwoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
