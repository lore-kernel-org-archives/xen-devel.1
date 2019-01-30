From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/pv-shim: Avoid a command line parameter
 warning for CONFIG_PV_SHIM_EXCLUSIVE builds
Date: Wed, 30 Jan 2019 03:06:53 -0700
Message-ID: <5C51773D0200007800212373@prv1-mh.provo.novell.com>
References: <1548788870-1851-1-git-send-email-andrew.cooper3@citrix.com>
 <5C51751B0200007800212354@prv1-mh.provo.novell.com>
 <804418e7-a5c8-b108-dceb-a9ca7c04d312@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <804418e7-a5c8-b108-dceb-a9ca7c04d312@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjAxLjE5IGF0IDExOjAxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMzAvMDEvMjAxOSAwOTo1NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDI5
LjAxLjE5IGF0IDIwOjA3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiAt
LS0gYS94ZW4vYXJjaC94ODYvcHYvc2hpbS5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvcHYvc2hp
bS5jCj4+PiBAQCAtNDAsNyArNDAsMTEgQEAKPj4+ICAjdW5kZWYgdmlydF90b19tZm4KPj4+ICAj
ZGVmaW5lIHZpcnRfdG9fbWZuKHZhKSBfbWZuKF9fdmlydF90b19tZm4odmEpKQo+Pj4gIAo+Pj4g
LSNpZm5kZWYgQ09ORklHX1BWX1NISU1fRVhDTFVTSVZFCj4+PiArI2lmZGVmIENPTkZJR19QVl9T
SElNX0VYQ0xVU0lWRQo+Pj4gKy8qIFRvbGVyYXRlICJwdi1zaGltIiBiZWluZyBwYXNzZWQgdG8g
YSBDT05GSUdfUFZfU0hJTV9FWENMVVNJVkUgaHlwZXJ2aXNvci4gKi8KPj4+ICtzdGF0aWMgYm9v
bCBfZGlzY2FyZDsKPj4+ICtib29sZWFuX3BhcmFtKCJwdi1zaGltIiwgX2Rpc2NhcmQpOwo+Pj4g
KyNlbHNlCj4+PiAgYm9vbCBwdl9zaGltOwo+Pj4gIGJvb2xlYW5fcGFyYW0oInB2LXNoaW0iLCBw
dl9zaGltKTsKPj4+ICAjZW5kaWYKPj4gSXQgd291bGQgZW5kIHVwIGJlaW5nIGxlc3MgZXh0cmEg
Y29kZSBpZiB5b3UgZGlkCj4+Cj4+ICNpZmRlZiBDT05GSUdfUFZfU0hJTV9FWENMVVNJVkUKPj4g
LyogVG9sZXJhdGUgInB2LXNoaW0iIGJlaW5nIHBhc3NlZCB0byBhIENPTkZJR19QVl9TSElNX0VY
Q0xVU0lWRSBoeXBlcnZpc29yLiAqLwo+PiBzdGF0aWMgYm9vbCBfX2luaXRkYXRhIHB2X3NoaW07
Cj4+ICNlbHNlCj4+IGJvb2wgcHZfc2hpbTsKPj4gI2VuZGlmCj4+IGJvb2xlYW5fcGFyYW0oInB2
LXNoaW0iLCBwdl9zaGltKTsKPiAKPiBTYWRseSBub3QuICBJbiB0aGUgRVhDTFVTSVZFIGNhc2Us
IHB2X3NoaW0gaXMgZGVmaW5lZCB0byBiZSAxLCBhbmQgdGhlbgo+IHlvdSd2ZSBnb3QgYW4gb2Jq
ZWN0IG5hbWVkIHdpdGgganVzdCBhIG51bWJlci4gIChJIHRyaWVkIHRoaXMgYXBwcm9hY2gKPiBm
aXJzdC4pCgpPaCwgdGhhdCdzIHVuZm9ydHVuYXRlIGluIHRoaXMgcGFydGljdWxhciBjYXNlLiBJ
biB3aGljaCBjYXNlIEkKZG9uJ3QgaGF2ZSBhbnkgYmV0dGVyIHN1Z2dlc3Rpb24gZWl0aGVyLiBP
bmUgdGhhdCB5b3UgYW5kIG90aGVycwpwZXJoYXBzIHdvdWxkbid0IGxpa2Ugd291bGQgYmUKCmN1
c3RvbV9wYXJhbSgicHYtc2hpbSIsIE5VTEwpOwoKd2l0aCBwYXJzZV9wYXJhbXMoKSBzdWl0YWJs
eSBhZGp1c3RlZCB0byBhdm9pZCB0aGUgY2FsbCBpbiB0aGF0CmNhc2UuCgpKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
