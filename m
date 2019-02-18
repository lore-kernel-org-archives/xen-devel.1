From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: Enhancing Xen's Kconfig infrastructure to support
 tailored solutions
Date: Mon, 18 Feb 2019 11:30:28 +0000
Message-ID: <59568551-146c-e0b7-2f94-4f9ee19c5325@citrix.com>
References: <a49643ec-6bbe-04be-1ae2-b1d731da92cf@gmail.com>
 <20190213182544.2tguperv3yliejch@zion.uk.xensource.com>
 <alpine.DEB.2.10.1902131110270.5641@sstabellini-ThinkPad-X260>
 <5C653AB10200007800216997@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1902140938160.5641@sstabellini-ThinkPad-X260>
 <AB54071B-07B5-4FFC-A1A4-781C24F61D93@gmail.com>
 <20190215110807.jtybxyfl523vwo3y@zion.uk.xensource.com>
 <alpine.DEB.2.10.1902151105580.5641@sstabellini-ThinkPad-X260>
 <20190218111234.r7ae42wswy2hjo7k@zion.uk.xensource.com>
 <1636EB19-FE45-42FF-B4D3-8CE8853BD040@gmail.com>
 <20190218112337.qoyws3pedxav4wmf@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190218112337.qoyws3pedxav4wmf@zion.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Lars Kurth <lars.kurth.xen@gmail.com>
Cc: James McKenzie <james.mckenzie@bromium.com>, robin.randhawa@arm.com, 'Jan Beulich' <JBeulich@suse.com>, Daniel Smith <dpsmith@apertussolutions.com>, Doug Goldstein <cardoe@cardoe.com>, Christopher Clark <christopher.w.clark@gmail.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, "Daniel P.Smith" <dpsmith.dev@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, committers@xenproject.org, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jun Nakajima <jun.nakajima@intel.com>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, xen-devel <xen-devel@lists.xen.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8xOC8xOSAxMToyMyBBTSwgV2VpIExpdSB3cm90ZToKPiBPbiBNb24sIEZlYiAxOCwgMjAx
OSBhdCAxMToxNzo1NkFNICswMDAwLCBMYXJzIEt1cnRoIHdyb3RlOgo+PiBUaGFuayB5b3UgV2Vp
LiBJdCdzIGludGVyZXN0aW5nIHRob3VnaCB0aGF0IHRoZSBmdWxsIHZzIEhWTSBvbmx5IGlzIGFs
bW9zdCBpZGVudGljYWwgaW4gdGVybXMgb2YgU0xPQydzCj4+IExhcnMKPiAKPiBUaGUgY2xvYyB0
YXJnZXQgY291bnRzIHRoZSBmaWxlcyBpbiB0aGUgZGVwZW5kZW5jeSBncmFwaCBnZW5lcmF0ZWQg
YnkKPiBtYWtlLiBBIGxvdCBvZiB0aGUgZmlsZXMgY29udGFpbiBib3RoIGNvbW1vbiB4ODYgY29k
ZSBhbmQgUFYgb25seSBjb2RlLgo+IFNvIGFuIEhWTSBvbmx5IGJ1aWxkIHdpbGwgY291bnQgc29t
ZSBvZiB0aGUgUFYgY29kZS4KClN0aWxsLCB3aGF0IHRoYXQgc2hvd3MgaXMgdGhhdCB0aGVyZSBo
YXZlIGJlZW4gbmVhcmx5IDI1ayBsaWtlcyBvZiBjb2RlCmlkZW50aWZpZWQgYXMgIkhWTS1vbmx5
Iiwgd2hpbGUgdGhlcmUgaGF2ZSBiZWVuIGxlc3MgdGhhbiA1ayBsaWtlcyBvZgpjb2RlIGlkZW50
aWZpZWQgYXMgIlBWLW9ubHkiLiAgVGhhdCdzIHF1aXRlIGEgYml0IG1vcmUgbG9wc2lkZWQgdGhh
biBJCndhcyBleHBlY3RpbmcuCgpQZXJoYXBzIHBhcnQgb2YgdGhlIGV4cGxhbmF0aW9uIGlzIHRo
YXQgUFYgY2FtZSBmaXJzdCwgYW5kIEhWTQphZnRlcndhcmRzOyBhbmQgdGhlIGNvcmUgIlhlbiIg
aW50ZXJmYWNlcyAoZ3JhbnQgdGFibGVzLCAmYykgYXJlIHRoZQpzYW1lIGJldHdlZW4gdGhlIHR3
by4gIFRoYXQgaXMsIEhWTSBndWVzdHMgKGlmIHdlIGluY2x1ZGUgUFZIIGRvbTApIGhhdmUKdGhl
IHZhc3QgbWFqb3JpdHkgb2YgZnVuY3Rpb25hbGl0eSBhdmFpbGFibGUgdG8gUFYgZ3Vlc3RzLCB3
aGlsZSB0aGVyZQphcmUgbGFyZ2Ugc2VjdGlvbnMgb2YgZnVuY3Rpb25hbGl0eSBhdmFpbGFibGUg
dG8gSFZNIGd1ZXN0cyB0byB3aGljaCBQVgpndWVzdHMgaGF2ZSBubyBhY2Nlc3MuCgogLUdlb3Jn
ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
