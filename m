From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 00/49] xen: add core scheduling support
Date: Mon, 1 Apr 2019 09:15:12 +0200
Message-ID: <bfe2c139-2972-7cb4-e78f-4a4399cf7c89@suse.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <5CA1B285020000780022361D@suse.com>
 <10544c22-138e-c993-ca7f-3a3392e03243@suse.com>
 <36496b27179ccd23aeb3e051e3ded04fdb493b8c.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7l/E=SD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hArA6-0003gL-2k
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 07:15:18 +0000
In-Reply-To: <36496b27179ccd23aeb3e051e3ded04fdb493b8c.camel@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Robert VanVossen <Robert.VanVossen@dornerworks.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Joshua Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDQvMjAxOSAwOToxMCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gTW9uLCAyMDE5
LTA0LTAxIGF0IDA4OjQ5ICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAwMS8wNC8y
MDE5IDA4OjQxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IE9uZSBmdXJ0aGVyIGdlbmVyYWwgcXVl
c3Rpb24gY2FtZSB0byBtaW5kOiBIb3cgYWJvdXQgYWxzbyBoYXZpbmcKPj4+ICJzY2hlZC1ncmFu
dWxhcml0eT10aHJlYWQiIChvciAiLi4uPW5vbmUiKSB0byByZXRhaW4gY3VycmVudAo+Pj4gYmVo
YXZpb3IsIGF0IGxlYXN0IHRvIGhhdmUgYW4gZWFzeSB3YXkgdG8gY29tcGFyZSBlZmZlY3RzIGlm
Cj4+PiB3YW50ZWQ/IEJ1dCBwZXJoYXBzIGFsc28gdG8gYWxsb3cgdG8gZGVhbCB3aXRoIHBvdGVu
dGlhbCByZXNvdXJjZXMKPj4+IHdhc3RpbmcgY29uZmlndXJhdGlvbnMgbGlrZSBoYXZpbmcgbW9z
dGx5IFZNcyB3aXRoIGUuZy4gYW4gb2RkCj4+PiBudW1iZXIgb2YgdkNQVS1zLgo+Pgo+PiBGaW5l
IHdpdGggbWUuCj4+Cj4gTW1tLi4uIEknbSBzdGlsbCBpbiB0aGUgcHJvY2VzcyBvZiBsb29raW5n
IGF0IHRoZSBwYXRjaGVzLCBzbyB0aGVyZQo+IG1pZ2h0IGJlIHNvbWV0aGluZyBJJ20gbWlzc2lu
ZywgYnV0LCBmcm9tIHRoZSBkZXNjcmlwdGlvbnMgYW5kIGZyb20KPiB0YWxraW5nIHRvIHlvdSAo
SnVlcmdlbiksIEkgd2FzIGFzc3VtaW5nIHRoYXQgdG8gYmUgdGhlIGNhc2UgYWxyZWFkeS4uLgo+
IGlzbid0IGl0IHNvPwoKWWVzLCBpdCBpcy4KCkkgdW5kZXJzdG9vZCBKYW4gdG8gYXNrIGZvciBh
IHNwZWNpYWwgcGFyYW1ldGVyIHZhbHVlIGZvciB0aGF0LgoKCkp1ZXJnZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
