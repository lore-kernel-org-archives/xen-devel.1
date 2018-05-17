From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: Change return type to vm_fault_t
Date: Thu, 17 May 2018 08:43:55 +0200
Message-ID: <06389ef0-bb8e-40e3-2b7e-ef7ced1362bd@suse.com>
References: <20180414191542.GA19820@jordon-HP-15-Notebook-PC>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ents=ie=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fJCdp-0004li-PL
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 06:43:57 +0000
In-Reply-To: <20180414191542.GA19820@jordon-HP-15-Notebook-PC>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Souptick Joarder <jrdr.linux@gmail.com>, boris.ostrovsky@oracle.com
Cc: xen-devel@lists.xenproject.org, willy@infradead.org
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDQvMTggMjE6MTUsIFNvdXB0aWNrIEpvYXJkZXIgd3JvdGU6Cj4gVXNlIG5ldyByZXR1
cm4gdHlwZSB2bV9mYXVsdF90IGZvciBmYXVsdCBoYW5kbGVyCj4gaW4gc3RydWN0IHZtX29wZXJh
dGlvbnNfc3RydWN0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNvdXB0aWNrIEpvYXJkZXIgPGpyZHIu
bGludXhAZ21haWwuY29tPgo+IFJldmlld2VkLWJ5OiBNYXR0aGV3IFdpbGNveCA8bWF3aWxjb3hA
bWljcm9zb2Z0LmNvbT4KClB1c2hlZCB0byB4ZW4vdGlwLmdpdCBmb3ItbGludXMtNC4xOAoKCkp1
ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
