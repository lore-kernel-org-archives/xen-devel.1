From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] xen/sched: Re-position the
 domain_update_node_affinity() call during vcpu construction
Date: Mon, 10 Sep 2018 12:27:03 +0100
Message-ID: <21016b13-34eb-eef1-2646-d86901b0ae13@arm.com>
References: <1536242495-21173-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1536242495-21173-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmV3LAoKT24gMDYvMDkvMTggMTU6MDEsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gYWxs
b2NfdmNwdSgpJ3MgY2FsbCB0byBkb21haW5fdXBkYXRlX25vZGVfYWZmaW5pdHkoKSBoYXMgZXhp
c3RlZCBmb3IgYSBkZWNhZGUsCj4gYnV0IGl0cyBlZmZvcnQgaXMgbW9zdGx5IHdhc3RlZC4KPiAK
PiBhbGxvY192Y3B1KCkgaXMgY2FsbGVkIGluIGEgbG9vcCBmb3IgZWFjaCB2Y3B1LCBicmluZ2lu
ZyB0aGVtIGludG8gZXhpc3RlbmNlLgo+IFRoZSB2YWx1ZXMgb2YgdGhlIGFmZmluaXR5IG1hc2tz
IGFyZSBzdGlsbCBkZWZhdWx0LCB3aGljaCBpcyBhbGxjcHVzIGluCj4gZ2VuZXJhbCwgb3IgYSBw
cm9jZXNzb3Igc2luZ2xldG9uIGZvciBwaW5uZWQgZG9tYWlucy4KPiAKPiBGdXJ0aGVybW9yZSwg
ZG9tYWluX3VwZGF0ZV9ub2RlX2FmZmluaXR5KCkgaXRzZWxmIGxvb3BzIG92ZXIgYWxsIHZjcHVz
Cj4gYWNjdW11bGF0aW5nIHRoZSBtYXNrcywgbWFraW5nIGl0IGEgc2NhbGFiaWxpdHkgY29uY2Vy
biB3aXRoIGxhcmdlIG51bWJlcnMgb2YKPiB2Y3B1cy4KPiAKPiBNb3ZlIGl0IHRvIGJlIGNhbGxl
ZCBvbmNlIGFmdGVyIGFsbCB2Y3B1cyBhcmUgY29uc3RydWN0ZWQsIHdoaWNoIGhhcyB0aGUgc2Ft
ZQo+IG5ldCBlZmZlY3QsIGJ1dCB3aXRoIGZld2VyIGludGVybWVkaWF0ZSBtZW1vcnkgYWxsb2Nh
dGlvbnMgYW5kIGxlc3MgY3B1bWFzawo+IGFyaXRobWV0aWMuCj4gCj4gU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkZvciBBcm0gYml0czoK
CkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoK
LS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
