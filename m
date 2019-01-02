From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/5] xen/arm: copy dtb fragment to guest dtb
Date: Wed, 2 Jan 2019 12:22:01 +0000
Message-ID: <20190102122201.uwyzr7j5nd6jaiai@zion.uk.xensource.com>
References: <alpine.DEB.2.10.1812050923160.527@sstabellini-ThinkPad-X260>
 <1544030891-11906-1-git-send-email-sstabellini@kernel.org>
 <bb30fde0-8870-d433-c0fe-5c7cad5aade7@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <bb30fde0-8870-d433-c0fe-5c7cad5aade7@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, Lars Kurth <lars.kurth@citrix.com>, Achin.Gupta@arm.com, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Committers <committers@xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBEZWMgMjQsIDIwMTggYXQgMTE6MTc6NTdBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+ICgrIFdlaSBhbmQgSWFuKQo+IAo+IEhpIFN0ZWZhbm8sCj4gCj4gT24gMTIvNS8xOCA1
OjI4IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBSZWFkIHRoZSBkdGIgZnJhZ21l
bnQgY29ycmVzcG9uZGluZyB0byBhIHBhc3N0aHJvdWdoIGRldmljZSBmcm9tIG1lbW9yeQo+ID4g
YXQgdGhlIGxvY2F0aW9uIHJlZmVycmVkIHRvIGJ5IHRoZSAibXVsdGlib290LGR0YiIgY29tcGF0
aWJsZSBub2RlLgo+ID4gCj4gPiBDb3B5IHRoZSBmcmFnbWVudCB0byB0aGUgZ3Vlc3QgZHRiLgo+
ID4gCj4gPiBBZGQgYSBkdGJfYm9vdG1vZHVsZSBmaWVsZCB0byBzdHJ1Y3Qga2VybmVsX2luZm8g
dG8gZmluZCB0aGUgZHRiCj4gPiBmcmFnbWVudCBmb3IgYSBndWVzdC4KPiAKPiBUaGUgY29kZSBi
ZWxvdyBpcyBiYXNpY2FsbHkgYSBjb3B5IGZyb20gbGlieGwsIHJpZ2h0PyBJZiBzbywgdGhpcyBz
aG91bGQgYmUKPiBzcGVjaWZpZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgo+IAo+IEFsc28sIHRo
ZSBsaWNlbnNlIGlzIGRpZmZlcmVudCBpbiBsaWJ4bCBjb21wYXJlIHRvIHRoZSBoeXBlcnZpc29y
IChMR1BMdjIuMQo+IHZzIEdQTHYyKS4gU28gaXMgdGhlcmUgYW55IGlzc3VlIHRvIGNvcHkgdGhh
dCBjb2RlIGluIHRoZSBoeXBlcnZpc29yPwoKaHR0cHM6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy9n
cGwtZmFxLmh0bWwjQWxsQ29tcGF0aWJpbGl0eQoKSXQgYXBwZWFycyB0byBiZSBva2F5IC0tIEkg
d2FzIGxvb2tpbmcgYXQgIkkgd2FudCB0byBjb3B5IGNvZGUgdW5kZXI6CkxHUEwgdjIuMSBvbmx5
IiBhbmQgIkkgd2FudCB0byBsaWNlbnNlIG15IGNvZGUgdW5kZXI6IEdQTHYyIG9ubHkiLiBUaGUK
cmVzdWx0aW5nIGxpY2Vuc2UgZm9yIHRoZSBjb3BpZWQgY29kZSBpcyBHUEx2Mi4KCkkgaGF2ZSBD
QydlZCBMYXJzIGFuZCBjb21taXR0ZXJzQCBmb3IgbW9yZSBvcGluaW9ucy4KCldlaS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
