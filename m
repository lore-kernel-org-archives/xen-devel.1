From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: Change return type to vm_fault_t
Date: Mon, 16 Apr 2018 10:02:47 +0200
Message-ID: <3b3aaa67-7166-34ba-39d8-5a1e1d138309@suse.com>
References: <20180414191542.GA19820@jordon-HP-15-Notebook-PC>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=dujn=hf=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f7z6B-0001Zy-7w
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 08:02:51 +0000
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
bWljcm9zb2Z0LmNvbT4KClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+CgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
