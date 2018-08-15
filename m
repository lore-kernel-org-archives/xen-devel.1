From: Juergen Gross <jgross@suse.com>
Subject: Re: L1TF, and future work
Date: Wed, 15 Aug 2018 16:11:18 +0200
Message-ID: <da0da256-75ad-a6d5-3cea-345cf2b4dab3@suse.com>
References: <4dad178a-91c7-c328-9bc5-4362945d4725@citrix.com>
 <b92463c8-e465-b206-4aa6-d6a97d3cd32e@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <b92463c8-e465-b206-4aa6-d6a97d3cd32e@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel List <xen-devel@lists.xen.org>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Tim Deegan <tim@xen.org>, Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <JBeulich@suse.com>, Xen Security <security@xen.org>, "Woodhouse,
 David" <dwmw@amazon.co.uk>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDgvMTggMTU6MjEsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTUvMDgvMTggMTQ6
MTcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IEhlbGxvLAo+IAo+IEFwb2xvZ2llcy7CoCBHZXR0
aW5nIERhcmlvJ3MgY29ycmVjdCBlbWFpbCBhZGRyZXNzIHRoaXMgdGltZS4KPiAKPj4KPj4gTm93
IHRoYXQgdGhlIGVtYmFyZ28gb24gWFNBLTI3MyBpcyB1cCwgd2UgY2FuIHN0YXJ0IHB1YmxpY2x5
IGRpc2N1c3NpbmcKPj4gdGhlIHJlbWFpbmluZyB3b3JrIGRvLCBiZWNhdXNlIHRoZXJlIGlzIHBs
ZW50eSB0byBkby7CoCBJbiBubyBwYXJ0aWN1bGFyCj4+IG9yZGVyLi4uCj4+Cj4+IDEpIEF0dGVt
cHRpbmcgdG8gc2hhZG93IGRvbTAgZnJvbSBib290IGxlYWRzIHRvIHNvbWUgYXNzZXJ0aW9ucyB2
ZXJ5Cj4+IHZlcnkgcXVpY2tseS7CoMKgIFNoYWRvd2luZyBkb20wIGFmdGVyLXRoZS1mYWN0IGxl
YWRzIHRvIHNvbWUgdmVyeSB3ZWlyZAo+PiBjcmFzaGVzIHdoZXJlIHdob2xlIHN3YXRoZXMgb2Yg
dGhlIHNoYWRvdyBhcHBlYXJzIHRvIGJlIG1pc3NpbmcuwqAgVGhpcwo+PiBpcyB3aHksIGZvciBu
b3csIGF1dG9tYXRpYyBzaGFkb3dpbmcgb2YgZG9tMCBpcyBkaXNhYmxlZCBieSBkZWZhdWx0Lgo+
Pgo+PiAyKSAzMmJpdCBQViBndWVzdHMgd2hpY2ggdXNlIHdyaXRlYWJsZSBwYWdldGFibGUgc3Vw
cG9ydCB3aWxsCj4+IGF1dG9tYXRpY2FsbHkgZ2V0IHNoYWRvd2VkIHdoZW4gdGhlIGNsZWFyIHRo
ZSBsb3dlciBoYWxmLsKgIElkZWFsbHksIHN1Y2gKPj4gZ3Vlc3RzIHNob3VsZCBiZSBtb2RpZmll
ZCB0byB1c2UgaHlwZXJjYWxscyByYXRoZXIgdGhhbiB0aGUgcHR3cgo+PiBpbmZyYXN0cnVjdHVy
ZSAoYXMgaXRzIG1vcmUgZWZmaWNpZW50IHRvIGJlZ2luIHdpdGgpLCBidXQgd2UgY2FuCj4+IHBy
b2JhYmx5IHdvcmsgYXJvdW5kIHRoaXMgaW4gWGVuIGJ5IGVtdWxhdGluZyB0aGUgbmV4dCBmZXcg
aW5zdHJ1Y3Rpb25zCj4+IHVudGlsIHdlIGhhdmUgYSBjb21wbGV0ZSBQVEUgKHNhbWUgYXMgdGhl
IHNoYWRvdyBjb2RlKS4KCkkgY2FuIHdvcmsgb24gdGhhdCBpbiB0aGUgTGludXgga2VybmVsLgoK
VGhlcmUgaGFzIGJlZW4gYW5vdGhlciBidWcgd2hpY2ggSSBzdXNwZWN0IGlzIHJlbGF0ZWQgdG8g
dGhhdDoKCmh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTk4NDk3
CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
