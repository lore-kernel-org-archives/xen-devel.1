From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen: Improvements to domain_crash()
Date: Fri, 31 Aug 2018 09:14:51 -0600
Message-ID: <5B895B6B02000078001E3E4B@prv1-mh.provo.novell.com>
References: <1535643097-12059-1-git-send-email-andrew.cooper3@citrix.com>
 <5B88FEAA02000078001E3C71@prv1-mh.provo.novell.com>
 <acdedc91-1ad8-0e20-cc06-fbba17deb55d@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <acdedc91-1ad8-0e20-cc06-fbba17deb55d@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Dario Faggioli <dfaggioli@suse.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjA4LjE4IGF0IDE1OjQ4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMzEvMDgvMTggMDk6MzksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAzMC4w
OC4xOCBhdCAxNzozMSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gQEAg
LTI2ODYsMTcgKzI2NzgsMjIgQEAgc3RhdGljIHZvaWQgKmh2bV9tYXBfZW50cnkodW5zaWduZWQg
bG9uZyB2YSwgYm9vbF90ICp3cml0YWJsZSkKPj4+ICAgICAgcGZlYyA9IFBGRUNfcGFnZV9wcmVz
ZW50Owo+Pj4gICAgICBnZm4gPSBwYWdpbmdfZ3ZhX3RvX2dmbihjdXJyZW50LCB2YSwgJnBmZWMp
Owo+Pj4gICAgICBpZiAoIHBmZWMgJiAoUEZFQ19wYWdlX3BhZ2VkIHwgUEZFQ19wYWdlX3NoYXJl
ZCkgKQo+Pj4gLSAgICAgICAgZ290byBmYWlsOwo+Pj4gKyAgICB7Cj4+PiArICAgICAgICBkb21h
aW5fY3Jhc2goY3VycmVudC0+ZG9tYWluLCAiRGVzY3JpcHRvciB0YWJsZSBpcyBwYWdlZCBvciBz
aGFyZWRcbiIpOwo+PiBTaW5jZSBhIHBhZ2UgY2FuJ3QgYmUgcGFnZWQgYW5kIHNoYXJlZCBhdCB0
aGUgc2FtZSB0aW1lLCBwZXJoYXBzIGJldHRlcgo+PiB0byBsb2cganVzdCBvbmUgb2YgdGhlIHR3
byAod2hpY2hldmVyIGlzIGFwcGxpY2FibGUpPwo+IAo+IEkgY291bGQgZm9ybWF0IHBmZWMgaW50
byB0aGUgbWVzc2FnZT8KClRoYXQncyBhbHNvIGFuIG9wdGlvbiwgYnV0IHNsaWdodGx5IG1vcmUg
ZGlmZmljdWx0IHRvIGRlY2lwaGVyLCBzaG91bGQgaXQKcmVhbGx5IGhhcHBlbiB0byBiZSBsb2dn
ZWQuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
