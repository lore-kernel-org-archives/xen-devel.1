From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: libxc: Casting of xen virtual address type
 xen_vaddr_t to signed int64 type: (int64_t)vaddr
Date: Fri, 17 May 2019 06:32:12 -0600
Message-ID: <5CDEA9CC020000780023017C@prv1-mh.provo.novell.com>
References: <CAOcoXZZZbKOXkNQNqFgp9BSRUHnovDqZ4TfV_aMh+h9BcC6Qnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRc23-0007jH-DR
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 12:32:15 +0000
In-Reply-To: <CAOcoXZZZbKOXkNQNqFgp9BSRUHnovDqZ4TfV_aMh+h9BcC6Qnw@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Viktor Mitin <viktor.mitin.19@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA1LjE5IGF0IDEzOjI1LCA8dmlrdG9yLm1pdGluLjE5QGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gSGkgQWxsLAo+IAo+IFdoaWxlIGxvb2tpbmcgYXQgY29kZSBpbiB0b29scy9saWJ4Yy94
Y19zcl9zYXZlX3g4Nl9wdi5jLAo+IHdlIHNlZSB0aGF0IHRoZXJlIGlzIGNhc3Rpbmcgb2YgeGVu
IHZpcnR1YWwgYWRkcmVzcyB0eXBlIHhlbl92YWRkcl90Cj4gdG8gc2lnbmVkIGludDY0IHR5cGUu
Cj4gSW4gY29tbWl0OiA3YmY3NDU4MmIzNDM2MDNjYjA4MjZkODA4Y2Q3ZGE0MzMyNjQ1MmE1Cj4g
Cj4gKy8qIENoZWNrIGEgNjQgYml0IHZpcnR1YWwgYWRkcmVzcyBmb3IgYmVpbmcgY2Fub25pY2Fs
LiAqLwo+ICtzdGF0aWMgaW5saW5lIGJvb2wgaXNfY2Fub25pY2FsX2FkZHJlc3MoeGVuX3ZhZGRy
X3QgdmFkZHIpCj4gK3sKPiArICAgIHJldHVybiAoKGludDY0X3QpdmFkZHIgPj4gNDcpID09ICgo
aW50NjRfdCl2YWRkciA+PiA2Myk7Cj4gK30KPiAKPiBJdCBzZWVtcyB0aGVyZSBpcyBubyBuZWVk
IHRvIGNhc3QgdmFkZHIgdmFyaWFibGUuIEl0IGxvb2tzIGxpa2UKPiBzaGlmdGluZyB2YWRkciBz
aWduZWQgNjQtYml0IHZhbHVlIGJ5IDYzIGJpdHMgaW50cm9kdWNlcyB1bmRlZmluZWQKPiBiZWhh
dmlvci4KCkkgZG9uJ3QgdGhpbmsgc28gLSBhcyBwZXIgbXkgcmVhZGluZyBvZiB0aGUgc3RhbmRh
cmQgdGV4dCwgVUIKcmVzdWx0cyBvbmx5IHdoZW4gdGhlIHNoaWZ0IGNvdW50IGlzIGdyZWF0ZXIg
b3IgZXF1YWwgdGhhbiB0aGUKd2lkdGggb2YgdGhlIChwcm9tb3RlZCkgc2hpZnRlZCB2YWx1ZSdz
IHR5cGUuIFRoZSByZXN1bHRzIG9mCmJvdGggc2hpZnRzIGFib3ZlIGFyZSBpbXBsZW1lbnRhdGlv
biBkZWZpbmVkIGFmYWljdC4KCj4gQ291bGQgeW91IHBsZWFzZSBkZXNjcmliZSB3aGF0IGlzIHRo
ZSByZWFzb24gZm9yIHRoaXMgY2FzdGluZz8KCldlbGwsIHdlIHdhbnQgdG8gY2hlY2sgdGhhdCB0
aGUgdG9wIDE3IGJpdHMgYXJlIGVpdGhlciBhbGwgMXMKb3IgYWxsIDBzLCBwcmVmZXJhYmx5IHdp
dGgganVzdCBhIHNpbmdsZSBjb21wYXJpc29uLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
