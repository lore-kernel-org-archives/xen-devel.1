From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH 2/2] x86: use invpcid to do global flushing
Date: Mon, 12 Mar 2018 07:13:19 -0600
Message-ID: <5AA67CEF0200007800129C5D@prv-mh.provo.novell.com>
References: <20180305095032.30062-1-wei.liu2@citrix.com>
 <20180305095032.30062-3-wei.liu2@citrix.com>
 <5AA2B67302000078001B0567@suse.com>
 <4fb72f31-683d-1de3-db90-4788a379b0bd@suse.com>
 <5AA679BD0200007800129C56@prv-mh.provo.novell.com>
 <4c0abb8c-7c16-6a89-29c1-d20e4c16e4c2@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=8lwx=gc=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1evNGb-0006MG-4s
 for xen-devel@lists.xenproject.org; Mon, 12 Mar 2018 13:13:29 +0000
In-Reply-To: <4c0abb8c-7c16-6a89-29c1-d20e4c16e4c2@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: andrew.cooper3@citrix.com, wei.liu2@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4gMDMvMTIvMTggMjoxMCBQTSA+Pj4K
PkJUVzogYXJlIHlvdSBhbHJlYWR5IHdvcmtpbmcgb24gcmViYXNpbmcgeW91ciBYUFRJIHNwZWVk
IHVwIHNlcmllcyB0bwo+Y3VycmVudCBzdGFnaW5nPyBJJ2QgbGlrZSBteSBzZXJpZXMgdG8gdXNl
IHlvdXIgc2VyaWVzIGFzIGEgYmFzZSB1bmxlc3MKPnlvdSBhcmUgdGVsbGluZyBtZSB5b3Ugd29u
J3QgYmUgYWJsZSB0byByZXNlbmQgeW91ciBzZXJpZXMgc29vbi4KCkkgaG9wZSB0byBiZSBhYmxl
IHRvIGdldCB0byB0aGlzIGxhdGVyIHRoaXMgd2Vlay4KCkphbgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
