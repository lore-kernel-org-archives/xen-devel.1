From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] libxc/arm: initialise p2m_size to make gcc
 happy
Date: Wed, 14 Mar 2018 07:45:48 -0600
Message-ID: <5AA9359C02000078001B18B4@prv-mh.provo.novell.com>
References: <20180314123203.30646-1-wei.liu2@citrix.com>
 <07ee36ed-a2c9-ac56-bceb-a3f85cfb27cb@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=0lyu=ge=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ew6j9-0008OH-1u
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 13:45:59 +0000
In-Reply-To: <07ee36ed-a2c9-ac56-bceb-a3f85cfb27cb@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAzLjE4IGF0IDEzOjM1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTQvMDMvMTggMTI6MzIsIFdlaSBMaXUgd3JvdGU6Cj4+IEdjYyB3aXRoIC1PMyBm
YWlsZWQgdG8gc3BvdCB0aGUgbG9vcCB0byBpbml0aWFsaXNlIHAybV9zaXplIHJ1bnMgYXQKPj4g
bGVhc3Qgb25jZS4KPiAKPiBJdCBpcyAtT2cgaW4gdGhpcyBjYXNlLCByYXRoZXIgdGhhbiAtTzMu
ICBNeSAtTzMgY29tbWVudCBvbiB0aGUgdGhyZWFkCj4gd2FzIGZvciB0aGUgbW9yZSBnZW5lcmlj
IGNhc2VzLgoKWWVhaCwgaXQgaXMgbGlrZWx5IHRoZSBmYWN0IHRoYXQgZ2NjIGRvZXMgX2xlc3Nf
IG9wdGltaXphdGlvbiB3aXRoIC1PZwp0aGF0IG1ha2VzIGl0IG5vIGxvbmdlciBzcG90IHRoYXQg
dGhlIHZhcmlhYmxlIGNhbid0IGJlIHVzZWQKdW5pbml0aWFsaXplZC4KCkphbgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
