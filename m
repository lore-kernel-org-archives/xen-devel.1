From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3] CONFIG_XEN_PV breaks
 xen_create_contiguous_region on ARM
Date: Fri, 2 Nov 2018 17:16:26 +0100
Message-ID: <5c442ccc-c066-72ef-76e1-1ff172205d48@suse.com>
References: <1541027509-25247-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gwqu=nn=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gIc7d-0007Vy-1A
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 16:16:33 +0000
In-Reply-To: <1541027509-25247-1-git-send-email-sstabellini@kernel.org>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefanos@xilinx.com>, Nathan.Studer@dornerworks.com, Jeff.Kubascik@dornerworks.com, julien.grall@arm.com, vkuznets@redhat.com, boris.ostrovsky@oracle.com, Jarvis.Roach@dornerworks.com
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTEvMjAxOCAwMDoxMSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IEZyb206IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4KPiAKPiB4ZW5fY3JlYXRlX2Nv
bnRpZ3VvdXNfcmVnaW9uIGhhcyBub3cgb25seSBhbiBpbXBsZW1lbnRhdGlvbiBpZgo+IENPTkZJ
R19YRU5fUFYgaXMgZGVmaW5lZC4gSG93ZXZlciwgb24gQVJNIHdlIG5ldmVyIHNldCBDT05GSUdf
WEVOX1BWIGJ1dAo+IHdlIGRvIGhhdmUgYW4gaW1wbGVtZW50YXRpb24gb2YgeGVuX2NyZWF0ZV9j
b250aWd1b3VzX3JlZ2lvbiB3aGljaCBpcwo+IHJlcXVpcmVkIGZvciBzd2lvdGxiLXhlbiB0byB3
b3JrIGNvcnJlY3RseSAoYWx0aG91Z2ggaXQganVzdCBzZXRzCj4gKmRtYV9oYW5kbGUpLgo+IAo+
IEZpeGVzOiAxNjYyNDM5MDgxNmMgKCJ4ZW46IGNyZWF0ZSB4ZW5fY3JlYXRlL2Rlc3Ryb3lfY29u
dGlndW91c19yZWdpb24oKSBzdHVicyBmb3IgUFZIVk0gb25seSBidWlsZHMiKQo+IFNpZ25lZC1v
ZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4KPiBDQzogSmVm
Zi5LdWJhc2Npa0Bkb3JuZXJ3b3Jrcy5jb20KPiBDQzogSmFydmlzLlJvYWNoQGRvcm5lcndvcmtz
LmNvbQo+IENDOiBOYXRoYW4uU3R1ZGVyQGRvcm5lcndvcmtzLmNvbQo+IENDOiB2a3V6bmV0c0By
ZWRoYXQuY29tCj4gQ0M6IGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tCj4gQ0M6IGpncm9zc0Bz
dXNlLmNvbQo+IENDOiBqdWxpZW4uZ3JhbGxAYXJtLmNvbQoKUmV2aWV3ZWQtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
