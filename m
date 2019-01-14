From: Rich Persaud <persaur@gmail.com>
Subject: Re: [PATCH v3 04/15] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Mon, 14 Jan 2019 09:28:45 -0500
Message-ID: <32F216B4-BA06-4D06-93E4-27EEEA8F9C92@gmail.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-5-git-send-email-christopher.w.clark@gmail.com>
 <CAPLaKK6z4eNtJx+X3RdTcO8tKb+PxaeBwA_N3wDmbXc7Qss58A@mail.gmail.com>
 <CACMJ4GYLajG5XaukVb1OdiCzZegEFeCoXFz6tKbRPk3vMyvMJA@mail.gmail.com>
 <CAPLaKK6=qkaoW0yVfrs6tn0W0JfHitwTfy81CHu1=o8o3=-qmw@mail.gmail.com>
 <CACMJ4GapSuzOnUrU-1Y5=Xs=cNz7aiXj7S1SQJiKdAQSmTHhqw@mail.gmail.com>
 <CAPLaKK7buD5st15ke7h3f_0Wmk6E1Hn9uCkQEyX63bK3Q-q0-A@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Content-Type: multipart/mixed; boundary="===============5633118065446462266=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gOfb=PW=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1gj3ER-0004GC-F5
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 14:28:51 +0000
Received: by mail-it1-x143.google.com with SMTP id a6so12351655itl.4
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jan 2019 06:28:47 -0800 (PST)
In-Reply-To: <CAPLaKK7buD5st15ke7h3f_0Wmk6E1Hn9uCkQEyX63bK3Q-q0-A@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <royger@freebsd.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============5633118065446462266==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-F3FCEDFD-A193-440B-B09E-300675DDF006
Content-Transfer-Encoding: 7bit


--Apple-Mail-F3FCEDFD-A193-440B-B09E-300675DDF006
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Jan 14, 2019, at 06:32, Roger Pau Monn=C3=A9 <royger@freebsd.org> wrote=
:
>=20
> On Mon, Jan 14, 2019 at 9:32 AM Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
>>=20
>> I've written a document about the locking to add to the tree with the
>> series, and a copy is at github here:
>>=20
>> https://github.com/dozylynx/xen/blob/0cb95385eba696ecf4856075a524c5e528e6=
0455/docs/misc/argo-locking.md
>=20
> Thanks. It would have been better to send the contents of the document
> to the list, so inline comments can be added. It's hard to comment on
> the document now since it's only on github AFAICT.

Here's an inline copy of the doc:

=3D=3D=3D begin document =3D=3D=3D

# Argo: Locking

## Introduction

Argo is an interdomain communication mechanism. It has requirements for perf=
ormance isolation between domains, to prevent negative performance impact fr=
om malicious or disruptive activity of other domains, or even other vcpus of=
 the same domain operating other rings.

Since Argo operates a data path between domains, sections of this code are *=
hot* when the communication paths are in use. To encourage high performance,=
 a goal is to limit mutual exclusion to only where required and enable signi=
ficant concurrency.

Avoidance of deadlock is essential and since state must frequently be update=
d that pertains to more than one domain, a locking protocol defines which lo=
cks are needed and the order of their acquistion.

## Structure

The granular locking structure of Argo enables:

1. Performance isolation of guests
2. Avoidance of DoS of rings by domains that are not authorized to send to t=
hem
3. Deadlock-free teardown of state across multiple domains on domain destroy=

4. Performance of guests using Argo with concurrent operation of rings.

Argo uses three per-domain locks to protect three separate data structures. =
 Access to the ring_hash data structure is confined to domains that a ring-r=
egistering domain has authorized to send data via the ring.  The complete se=
t of Argo locks is:

* Global : `L1_global_argo_rwlock`
* Per-domain: `rings_L2_rwlock`
* Per-domain: `send_L2_lock`
* Per-domain: `wildcard_L2_lock`
* Per-ring: `L3_lock`

## Protected State

The data structures being protected by the locks are all per-domain. The onl=
y global Argo state is the `L1_global_argo_rwlock` used to coordinate access=
 to data structures of other domains.

### State: Rings registered and owned by a domain

This includes the state to run that ring, such as memory frame numbers and e=
stablished mappings. Per-ring state is protected by its own lock, so that mu=
ltiple VCPUs of the same domain operating different rings do not inhibit the=
 performance of each other.

The per-domain ring state also includes the list of pending notifications fo=
r other domains that are waiting for ring space availability.

### State: Partner rings registered by other domains that this domain is the=
 single allowed sender

This state belonging to the permitted sender is written to when a ring is re=
gistered by another domain. The lock that protects this state is subject to l=
ocking at arbitrary frequency by those foreign domains when registering ring=
s -- which do not need any permission granted by this domain in order to reg=
ister a ring to communicate with it --  so it must not inhibit the domain's o=
wn ability to use its own rings, to protect them from DoS. For this reason, t=
his state is protected by its own lock.

### State: Pending notifications to this domain about wildcard rings registe=
red by other domains

This data structure is needed when a domain is destroyed, to cancel the outs=
tanding space availability notifications about the wildcard rings of other d=
omains that this domain has queried.

Data is entered into this data structure by the domain that owns it, either b=
y a space-inhibited sendv or a notify operation.

Data is removed from this data structure in one of three cases: when space b=
ecomes available in the destination ring and the notification is sent, when t=
he ring is torn down, or when the awaiting domain is destroyed.

In the case where a notification is sent, access to the data structure is tr=
iggered by the ring owner domain, rather than the domain waiting for notific=
ation. This data structure is protected by its own lock since doing so entai=
ls less contention than the alternative of reusing an existing lock owned by=
 the domain.

## Hierarchical Locking Model and Protocol

The locking discipline within the Argo code is heirarchical and utilizes rea=
der/writer locks to enable increased concurrency when operations do not conf=
lict. None of the Argo locks are reentrant.

The hierarchy:

* There is a global rwlock (`L1`) to protect access to all of the per-domain=
 argo data structures.=20
* There is a rwlock per-domain (`rings_L2`) to protect the hashtable of the p=
er-ring data structures.=20
* There is a lock per ring (`L3`) to protect the per-ring data structure, `s=
truct argo_ring_info`.=20

There are a two other per-domain L2 locks; their operation is similar and th=
ey are described later.

The protocol to safely acquire write access to the per-ring data structure, `=
struct argo_ring_info`, is:

1) Acquire a Read lock on L1.
2) Acquire a Read lock on L2.
3) Acquire L3.

An alternative valid sequence is:

1) Acquire a Read lock on L1.
2) Acquire a Write lock on L2.

This second sequence grants write access to _all_ of the `argo_ring_info` st=
ructs belonging to the domain, but at the expense of less concurrency: no ot=
her operation can access those structs while the locks are held, which will i=
nhibit operations on those rings until the locks are released.

Another alternative valid sequence is:

1) Acquire a Write lock on L1.

This grants write access to _all_ of the `argo_ring_info` structs belonging t=
o _all domains_, but again at the expense of far less concurrency: no other o=
peration can operate on Argo rings until the locks are released.

## Lock Definitions

The full set of locks that are directly operated upon by the Argo code are d=
escribed in the following section.

### The global singleton lock:

* `L1_global_argo_rwlock`

The rationale for having a global lock is to be able to enforce system-wide e=
xclusion for a critical region and simplify the logic required to avoid dead=
lock, for teardown of state across multiple domains when a domain is destroy=
ed.

The majority of operations take a read-lock on this lock, allowing concurren=
t Argo operations by many domains.

The pointer d->argo on every domain is protected by this lock. A set of more=
 granular per-domain locks could be used to do that, but since domain start a=
nd stop is expected to be a far less frequent operation than the other argo o=
perations, acquiring a single read lock to enable access to all the argo str=
ucts of all domains simplifies the protocol.

Points of write-locking on this lock:

* `argo_destroy`, where:
  * All of the domain's own rings are destroyed.
      * All of the notifications pending for other domains are cancelled.
   * All of the unicast partner rings owned by other domains for this domain=
 to send to, are destroyed.
      * All of the notifications pending on those rings are cancelled.
   * All of the notifications pending for this domain on wildcard rings owne=
d by other domains are cancelled.
* `argo_soft_reset`, for similar teardown operations as argo_destroy.
* `argo_init`, where the `d->argo` pointer is first populated.
  * Since the write lock is taken here, there is serialization all concurren=
t Argo operations around this single pointer write; this is the cost of usin=
g the simpler one global lock approach.

Enforcing that the write_lock is acquired on `L1_global_argo_rwlock` before e=
xecuting teardown, ensures that no teardown operations act concurrently and n=
o other Argo operations happen concurrently with a teardown. The teardown lo=
gic is free to safely modify the Argo state across all domains without havin=
g to acquire per-domain locks and deadlock cannot occur.

### Per-Domain: Ring hash lock

`rings_L2_rwlock`

Protects: the per-domain ring hash table of `argo_ring_info` structs.

Holding a read lock on `rings_L2` protects the ring hash table and the eleme=
nts in the hash table `d->argo->ring_hash`, and the `node` and `id` fields i=
n struct `argo_ring_info` in the hash table.

Holding a write lock on `rings_L2` protects all of the elements of all the s=
truct `argo_ring_info` belonging to this domain.

To take `rings_L2` you must already have `R(L1)`. `W(L1)` implies `W(rings_L=
2)` and `L3`.

Prerequisites:

* `R(L1_global_argo_rwlock)` must be acquired before taking either read or w=
rite on `rings_L2_rwlock`.
* `W(L1_global_argo_rwlock)` implies `W(rings_L2_rwlock)`, so if `W(L1_globa=
l_argo_rwlock)` is held, then `rings_L2_rwlock` does not need to be acquired=
, and all the data structures that `rings_L2_rwlock` protects can be accesse=
d as if `W(ring_L2_rwlock)` was held.

Is accessed by the hypervisor on behalf of:

* The domain that registered the ring.
* Any domain that is allowed to send to the ring -- so that's the partner do=
main, for unicast rings, or any domain, for wildcard rings.

### Send hash lock

`send_L2_lock`

Protects: the per-domain send hash table of `argo_send_info` structs.

Is accessed by the hypervisor on behalf of:

* Any domain that registers a ring that specifies the domain as the unicast s=
ender.
* The domain that has been allowed to send, as part of teardown when the dom=
ain is being destroyed.


### Wildcard pending list lock

`wildcard_L2_lock`

Protects: the per-domain list of pending notifications to the domain from wi=
ldcard rings owned by other domains.

Is accessed by the hypervisor on behalf of:

* The domain that issued a query to another about space availability in one o=
f its wildcard rings - this can be done by attempting a send operation when t=
here is insufficient ring space available at the time.
* Any domain that the domain has issued a query to about space availability i=
n one of their wildcard rings.

### Per-Ring locks:

* `L3_lock`

This lock protects the members of a `struct ring_info` which is the primary s=
tate for a domain's own registered ring.


## Reasoning Model

A common model for reasoning about concurrent code focusses on accesses to i=
ndividual variables: if code touches this variable, see that it first acquir=
es the corresponding lock and then drops it afterwards. A challenge with thi=
s model is in ensuring that the sequence of locks acquired within nested fun=
ctions, when operating on data from multiple domains with concurrent operati=
ons, is safe from deadlock.

An alternative method that is better suited to the Argo software is to consi=
der the execution path, the full sequence of locks acquired, accesses perfor=
med, and locks released, from entering an operation, to the completion of th=
e work.

An example code path for an operation:

`[entry] > -- [ take R(L1) ] -- [ take R(L2) ] -- loop [ take a L3 / drop L3=
 ] --  [ drop R(L2) ] -- [ drop R(L1)] -- > [exit]`

If a function implements a section of the path, it is important to know not o=
nly what variables the function itself operates upon, but also the locking s=
tate that will already have been established at the point when the function i=
s invoked, since this will affect what data the function can access. For thi=
s reason, comments in the code, or ASSERTs that explicitly check lock state,=
 communicate what the locking state is expected and intended to be when that=
 code is invoked. See the macros defined to support this for Argo later in t=
his document.


## Macros to Validate and Document Lock State

These macros encode the logic to verify that the locking has adhered to the l=
ocking discipline.

eg. On entry to logic that requires holding at least `R(rings_L2)`, this:

`ASSERT(LOCKING_Read_rings_L2(d));`

checks that the lock state is sufficient, validating that one of the followi=
ng must be true when executed:

`R(rings_L2) && R(L1)`
or:  `W(rings_L2) && R(L1)`
or:  `W(L1)`

The macros are defined thus:

```
/* RAW macros here are only used to assist defining the other macros below *=
/
#define RAW_LOCKING_Read_L1 (rw_is_locked(&L1_global_argo_rwlock))
#define RAW_LOCKING_Read_rings_L2(d) \
  (rw_is_locked(&d->argo->rings_L2_rwlock) && RAW_LOCKING_Read_L1)

/* The LOCKING macros defined below here are for use at verification points *=
/
#define LOCKING_Write_L1 (rw_is_write_locked(&L1_global_argo_rwlock))
#define LOCKING_Read_L1 (RAW_LOCKING_Read_L1 || LOCKING_Write_L1)

#define LOCKING_Write_rings_L2(d) \
  ((RAW_LOCKING_Read_L1 && rw_is_write_locked(&d->argo->rings_L2_rwlock)) ||=
 \
   LOCKING_Write_L1)

#define LOCKING_Read_rings_L2(d) \
  ((RAW_LOCKING_Read_L1 && rw_is_locked(&d->argo->rings_L2_rwlock)) || \
   LOCKING_Write_rings_L2(d) || LOCKING_Write_L1)

#define LOCKING_L3(d, r) \
  ((RAW_LOCKING_Read_rings_L2(d) && spin_is_locked(&r->L3_lock)) || \
   LOCKING_Write_rings_L2(d) || LOCKING_Write_L1)

#define LOCKING_send_L2(d) \
  ((RAW_LOCKING_Read_L1 && spin_is_locked(&d->argo->send_L2_lock)) || \
   LOCKING_Write_L1)
```

Here is an example of a macro in use:

```
static void
notify_ring(const struct domain *d, struct argo_ring_info *ring_info,
          struct hlist_head *to_notify)
{
  uint32_t space;

  ASSERT(LOCKING_Read_rings_L2(d));

  spin_lock(&ring_info->L3_lock);

  if ( ring_info->len )
      space =3D ringbuf_payload_space(d, ring_info);
  else
      space =3D 0;

  spin_unlock(&ring_info->L3_lock);

  if ( space )
      pending_find(d, ring_info, space, to_notify);
}

```

In the above example, it can be seen that it is safe to acquire the `L3` loc=
k because _at least_ `R(rings_L2)` is already held, as documented and verifi=
ed by the macro.

## Appendix:  FAQ / Other Considerations=20

### Why not have a single per-domain lock?

Due to performance isolation / DoS avoidance: if there is a single per-domai=
n lock, acquiring this lock will stall operations on other active rings owne=
d by the domain. A malicious domain can loop registering and unregistering r=
ings, without any consent by the targetted domain, which would experience de=
creased throughput due to the contention on the single per-domain lock. The g=
ranular locking structure of Argo prevents this. It also allows concurrent o=
peration of different rings by multiple VCPUs of the same domain without con=
tention, to avoid negative application performance interaction.

## Rationale for Using a Singleton Global Lock: L1

### Teardown on domain destroy

The single global lock enables exclusive access to the argo data structures a=
cross domains when a domain is destroyed. Every unicast ring that the dying d=
omain is the authorized sender is torn down and any pending space-available n=
otifications in other domain's wildcard rings are cancelled. This requires g=
aining safe access to the data structures on each of the domains involved.

The 'send hashtable' data structure is needed in order to perform the teardo=
wn of rings when a domain is destroyed. To populate it, whenever a unicast r=
ing is registered, the lock that protects that data structure must be taken e=
xclusively.

There are granular per-domain locks which protect the per-domain data struct=
ures. The global singleton L1 lock operates with-and-above the per-domain lo=
cks and is used to obtain exclusive access to multiple domain's argo data st=
ructures in the infrequent case where it is used -- for domain destroy -- wh=
ilst otherwise allowing concurrent access, via acquiring it with 'read' acce=
ss, for the majority of the time.

To perform the required state teardown on domain destruction, which can requ=
ire removing state from the data structures of multiple domains, a locking p=
rotocol to obtain mutual exclusion and safe access to the state is required,=
 without deadlocking.

Using the single global lock avoids the need for sequencing the acquisition o=
f multiple individual per-domain locks (and lower level data structure locks=
) to prevent deadlock: taking W(L1) grants access to all and taking R(L1) en=
sures that teardown of any domain will not interfere with any Argo hypercall=
 operation. It enables introducing granular locking without complex or error=
-prone lock acquisition logic.

=3D=3D=3D end document =3D=3D=3D

> There are also several claims that fine-grainer locking provides
> better performance in order to justify the need of such locks. IMO
> without providing any evidence of such performance benefit it's hard
> to be convinced so many locks are needed.

Benchmarks would be useful for regression testing.  We can investigate resou=
rcing for Argo synthetic benchmarks in the Xen 4.13 release cycle.  In the m=
eantime, we can cite the shipment of Citrix XenClient in 2011, followed by c=
ustomer production deployments of v4v in OpenXT and Bromium uXen (including H=
P business laptops).  Argo is derived from v4v.

Ian Pratt's PSEC 2018 presentation [1] on hypervisor security indirectly ref=
erenced v4v and uXen isolation/performance requirements, it may illustrate t=
he scope of possible Argo use cases.  Click the "uXen" button below the vide=
o to navigate to the clip.  There's also a uXen source code link.  An excerp=
t (my annotations in []):

"PV device interfaces all built on simple hypervisor copy-based primitive=20=


We came up with a very simple primitive [v4v] for communication between VMs,=
 between VMs and the host, and then just built everything on that primitive.=
  It's a simple copy-based primitive.  We didn't want any memory sharing of a=
ny kind.  Anything involving memory sharing ends up being complex ... Grant t=
ables being a huge example ... a copy-based approach is just much simpler, a=
nd actually, performance-wise, it turns out being equivalent from a performa=
nce point of view ...=20

Getting rid of other terrible ideas, like Xenstore ... we still want the pri=
mitive [v4v] interface to be able to support things like device reconnection=
.  That was a good idea, this idea that you can restart these driver domains=
, have VMs reconnect and be able to continue, that's very useful.  We want t=
o enable this simple primitive [v4v] to do that.  Then just build everything=
 using very simple, narrow interfaces."

[1]  https://www.platformsecuritysummit.com/2018/speaker/pratt/


Regards,
Rich=

--Apple-Mail-F3FCEDFD-A193-440B-B09E-300675DDF006
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><span></span></div><div di=
r=3D"ltr"><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"><div dir=3D"ltr"><span></span></div><div dir=3D"ltr"><meta http-equiv=
=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div dir=3D"ltr"><s=
pan></span></div><div dir=3D"ltr"><meta http-equiv=3D"content-type" content=3D=
"text/html; charset=3Dutf-8"><div dir=3D"ltr"><span></span></div><div dir=3D=
"ltr"><meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf-=
8"><div dir=3D"ltr"><span></span></div><div dir=3D"ltr"><span></span><br><bl=
ockquote type=3D"cite"><span>On Jan 14, 2019, at 06:32, Roger Pau Monn=C3=A9=
 &lt;<a href=3D"mailto:royger@freebsd.org">royger@freebsd.org</a>&gt; wrote:=
</span><br></blockquote><blockquote type=3D"cite"><span></span><br></blockqu=
ote><blockquote type=3D"cite"><span>On Mon, Jan 14, 2019 at 9:32 AM Christop=
her Clark</span><br></blockquote><blockquote type=3D"cite"><span>&lt;<a href=
=3D"mailto:christopher.w.clark@gmail.com">christopher.w.clark@gmail.com</a>&=
gt; wrote:</span><br></blockquote><blockquote type=3D"cite"><blockquote type=
=3D"cite"><span></span><br></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span>I've written a document about the locking=
 to add to the tree with the</span><br></blockquote></blockquote><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>series, and a copy is at gith=
ub here:</span><br></blockquote></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><span></span><br></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span><a href=3D"https://github.com/d=
ozylynx/xen/blob/0cb95385eba696ecf4856075a524c5e528e60455/docs/misc/argo-loc=
king.md">https://github.com/dozylynx/xen/blob/0cb95385eba696ecf4856075a524c5=
e528e60455/docs/misc/argo-locking.md</a></span><br></blockquote></blockquote=
><blockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D=
"cite"><span>Thanks. It would have been better to send the contents of the d=
ocument</span><br></blockquote><blockquote type=3D"cite"><span>to the list, s=
o inline comments can be added. It's hard to comment on</span><br></blockquo=
te><blockquote type=3D"cite"><span>the document now since it's only on githu=
b AFAICT.</span><br></blockquote><span></span><br><span>Here's an inline cop=
y of the doc:</span><br><span></span><br><span>=3D=3D=3D begin document =3D=3D=
=3D</span><br><span></span><br><span># Argo: Locking</span><br><span></span>=
<br><span>## Introduction</span><br><span></span><br><span>Argo is an interd=
omain communication mechanism. It has requirements for performance isolation=
 between domains, to prevent negative performance impact from malicious or d=
isruptive activity of other domains, or even other vcpus of the same domain o=
perating other rings.</span><br><span></span><br><span>Since Argo operates a=
 data path between domains, sections of this code are *hot* when the communi=
cation paths are in use. To encourage high performance, a goal is to limit m=
utual exclusion to only where required and enable significant concurrency.</=
span><br><span></span><br><span>Avoidance of deadlock is essential and since=
 state must frequently be updated that pertains to more than one domain, a l=
ocking protocol defines which locks are needed and the order of their acquis=
tion.</span><br><span></span><br><span>## Structure</span><br><span></span><=
br><span>The granular locking structure of Argo enables:</span><br><span></s=
pan><br><span>1. Performance isolation of guests</span><br><span>2. Avoidanc=
e of DoS of rings by domains that are not authorized to send to them</span><=
br><span>3. Deadlock-free teardown of state across multiple domains on domai=
n destroy</span><br><span>4. Performance of guests using Argo with concurren=
t operation of rings.</span><br><span></span><br><span>Argo uses three per-d=
omain locks to protect three separate data structures. &nbsp;Access to the r=
ing_hash data structure is confined to domains that a ring-registering domai=
n has authorized to send data via the ring. &nbsp;The complete set of Argo l=
ocks is:</span><br><span></span><br><span>* Global : `L1_global_argo_rwlock`=
</span><br><span>* Per-domain: `rings_L2_rwlock`</span><br><span>* Per-domai=
n: `send_L2_lock`</span><br><span>* Per-domain: `wildcard_L2_lock`</span><br=
><span>* Per-ring: `L3_lock`</span><br><span></span><br><span>## Protected S=
tate</span><br><span></span><br><span>The data structures being protected by=
 the locks are all per-domain. The only global Argo state is the `L1_global_=
argo_rwlock` used to coordinate access to data structures of other domains.<=
/span><br><span></span><br><span>### State: Rings registered and owned by a d=
omain</span><br><span></span><br><span>This includes the state to run that r=
ing, such as memory frame numbers and established mappings. Per-ring state i=
s protected by its own lock, so that multiple VCPUs of the same domain opera=
ting different rings do not inhibit the performance of each other.</span><br=
><span></span><br><span>The per-domain ring state also includes the list of p=
ending notifications for other domains that are waiting for ring space avail=
ability.</span><br><span></span><br><span>### State: Partner rings registere=
d by other domains that this domain is the single allowed sender</span><br><=
span></span><br><span>This state belonging to the permitted sender is writte=
n to when a ring is registered by another domain. The lock that protects thi=
s state is subject to locking at arbitrary frequency by those foreign domain=
s when registering rings -- which do not need any permission granted by this=
 domain in order to register a ring to communicate with it -- &nbsp;so it mu=
st not inhibit the domain's own ability to use its own rings, to protect the=
m from DoS. For this reason, this state is protected by its own lock.</span>=
<br><span></span><br><span>### State: Pending notifications to this domain a=
bout wildcard rings registered by other domains</span><br><span></span><br><=
span>This data structure is needed when a domain is destroyed, to cancel the=
 outstanding space availability notifications about the wildcard rings of ot=
her domains that this domain has queried.</span><br><span></span><br><span>D=
ata is entered into this data structure by the domain that owns it, either b=
y a space-inhibited sendv or a notify operation.</span><br><span></span><br>=
<span>Data is removed from this data structure in one of three cases: when s=
pace becomes available in the destination ring and the notification is sent,=
 when the ring is torn down, or when the awaiting domain is destroyed.</span=
><br><span></span><br><span>In the case where a notification is sent, access=
 to the data structure is triggered by the ring owner domain, rather than th=
e domain waiting for notification. This data structure is protected by its o=
wn lock since doing so entails less contention than the alternative of reusi=
ng an existing lock owned by the domain.</span><br><span></span><br><span>##=
 Hierarchical Locking Model and Protocol</span><br><span></span><br><span>Th=
e locking discipline within the Argo code is heirarchical and utilizes reade=
r/writer locks to enable increased concurrency when operations do not confli=
ct. None of the Argo locks are reentrant.</span><br><span></span><br><span>T=
he hierarchy:</span><br><span></span><br><span>* There is a global rwlock (`=
L1`) to protect access to all of the per-domain argo data structures. </span=
><br><span>* There is a rwlock per-domain (`rings_L2`) to protect the hashta=
ble of the per-ring data structures. </span><br><span>* There is a lock per r=
ing (`L3`) to protect the per-ring data structure, `struct argo_ring_info`. <=
/span><br><span></span><br><span>There are a two other per-domain L2 locks; t=
heir operation is similar and they are described later.</span><br><span></sp=
an><br><span>The protocol to safely acquire write access to the per-ring dat=
a structure, `struct argo_ring_info`, is:</span><br><span></span><br><span>1=
) Acquire a Read lock on L1.</span><br><span>2) Acquire a Read lock on L2.</=
span><br><span>3) Acquire L3.</span><br><span></span><br><span>An alternativ=
e valid sequence is:</span><br><span></span><br><span>1) Acquire a Read lock=
 on L1.</span><br><span>2) Acquire a Write lock on L2.</span><br><span></spa=
n><br><span>This second sequence grants write access to _all_ of the `argo_r=
ing_info` structs belonging to the domain, but at the expense of less concur=
rency: no other operation can access those structs while the locks are held,=
 which will inhibit operations on those rings until the locks are released.<=
/span><br><span></span><br><span>Another alternative valid sequence is:</spa=
n><br><span></span><br><span>1) Acquire a Write lock on L1.</span><br><span>=
</span><br><span>This grants write access to _all_ of the `argo_ring_info` s=
tructs belonging to _all domains_, but again at the expense of far less conc=
urrency: no other operation can operate on Argo rings until the locks are re=
leased.</span><br><span></span><br><span>## Lock Definitions</span><br><span=
></span><br><span>The full set of locks that are directly operated upon by t=
he Argo code are described in the following section.</span><br><span></span>=
<br><span>### The global singleton lock:</span><br><span></span><br><span>* `=
L1_global_argo_rwlock`</span><br><span></span><br><span>The rationale for ha=
ving a global lock is to be able to enforce system-wide exclusion for a crit=
ical region and simplify the logic required to avoid deadlock, for teardown o=
f state across multiple domains when a domain is destroyed.</span><br><span>=
</span><br><span>The majority of operations take a read-lock on this lock, a=
llowing concurrent Argo operations by many domains.</span><br><span></span><=
br><span>The pointer d-&gt;argo on every domain is protected by this lock. A=
 set of more granular per-domain locks could be used to do that, but since d=
omain start and stop is expected to be a far less frequent operation than th=
e other argo operations, acquiring a single read lock to enable access to al=
l the argo structs of all domains simplifies the protocol.</span><br><span><=
/span><br><span>Points of write-locking on this lock:</span><br><span></span=
><br><span>* `argo_destroy`, where:</span><br><span> &nbsp;&nbsp;* All of th=
e domain's own rings are destroyed.</span><br><span> &nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;* All of the notifications pending for other domains are cancel=
led.</span><br><span> &nbsp;&nbsp;&nbsp;* All of the unicast partner rings o=
wned by other domains for this domain to send to, are destroyed.</span><br><=
span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* All of the notifications pending=
 on those rings are cancelled.</span><br><span> &nbsp;&nbsp;&nbsp;* All of t=
he notifications pending for this domain on wildcard rings owned by other do=
mains are cancelled.</span><br><span>* `argo_soft_reset`, for similar teardo=
wn operations as argo_destroy.</span><br><span>* `argo_init`, where the `d-&=
gt;argo` pointer is first populated.</span><br><span> &nbsp;&nbsp;* Since th=
e write lock is taken here, there is serialization all concurrent Argo opera=
tions around this single pointer write; this is the cost of using the simple=
r one global lock approach.</span><br><span></span><br><span>Enforcing that t=
he write_lock is acquired on `L1_global_argo_rwlock` before executing teardo=
wn, ensures that no teardown operations act concurrently and no other Argo o=
perations happen concurrently with a teardown. The teardown logic is free to=
 safely modify the Argo state across all domains without having to acquire p=
er-domain locks and deadlock cannot occur.</span><br><span></span><br><span>=
### Per-Domain: Ring hash lock</span><br><span></span><br><span>`rings_L2_rw=
lock`</span><br><span></span><br><span>Protects: the per-domain ring hash ta=
ble of `argo_ring_info` structs.</span><br><span></span><br><span>Holding a r=
ead lock on `rings_L2` protects the ring hash table and the elements in the h=
ash table `d-&gt;argo-&gt;ring_hash`, and the `node` and `id` fields in stru=
ct `argo_ring_info` in the hash table.</span><br><span></span><br><span>Hold=
ing a write lock on `rings_L2` protects all of the elements of all the struc=
t `argo_ring_info` belonging to this domain.</span><br><span></span><br><spa=
n>To take `rings_L2` you must already have `R(L1)`. `W(L1)` implies `W(rings=
_L2)` and `L3`.</span><br><span></span><br><span>Prerequisites:</span><br><s=
pan></span><br><span>* `R(L1_global_argo_rwlock)` must be acquired before ta=
king either read or write on `rings_L2_rwlock`.</span><br><span>* `W(L1_glob=
al_argo_rwlock)` implies `W(rings_L2_rwlock)`, so if `W(L1_global_argo_rwloc=
k)` is held, then `rings_L2_rwlock` does not need to be acquired, and all th=
e data structures that `rings_L2_rwlock` protects can be accessed as if `W(r=
ing_L2_rwlock)` was held.</span><br><span></span><br><span>Is accessed by th=
e hypervisor on behalf of:</span><br><span></span><br><span>* The domain tha=
t registered the ring.</span><br><span>* Any domain that is allowed to send t=
o the ring -- so that's the partner domain, for unicast rings, or any domain=
, for wildcard rings.</span><br><span></span><br><span>### Send hash lock</s=
pan><br><span></span><br><span>`send_L2_lock`</span><br><span></span><br><sp=
an>Protects: the per-domain send hash table of `argo_send_info` structs.</sp=
an><br><span></span><br><span>Is accessed by the hypervisor on behalf of:</s=
pan><br><span></span><br><span>* Any domain that registers a ring that speci=
fies the domain as the unicast sender.</span><br><span>* The domain that has=
 been allowed to send, as part of teardown when the domain is being destroye=
d.</span><br><span></span><br><span></span><br><span>### Wildcard pending li=
st lock</span><br><span></span><br><span>`wildcard_L2_lock`</span><br><span>=
</span><br><span>Protects: the per-domain list of pending notifications to t=
he domain from wildcard rings owned by other domains.</span><br><span></span=
><br><span>Is accessed by the hypervisor on behalf of:</span><br><span></spa=
n><br><span>* The domain that issued a query to another about space availabi=
lity in one of its wildcard rings - this can be done by attempting a send op=
eration when there is insufficient ring space available at the time.</span><=
br><span>* Any domain that the domain has issued a query to about space avai=
lability in one of their wildcard rings.</span><br><span></span><br><span>##=
# Per-Ring locks:</span><br><span></span><br><span>* `L3_lock`</span><br><sp=
an></span><br><span>This lock protects the members of a `struct ring_info` w=
hich is the primary state for a domain's own registered ring.</span><br><spa=
n></span><br><span></span><br><span>## Reasoning Model</span><br><span></spa=
n><br><span>A common model for reasoning about concurrent code focusses on a=
ccesses to individual variables: if code touches this variable, see that it f=
irst acquires the corresponding lock and then drops it afterwards. A challen=
ge with this model is in ensuring that the sequence of locks acquired within=
 nested functions, when operating on data from multiple domains with concurr=
ent operations, is safe from deadlock.</span><br><span></span><br><span>An a=
lternative method that is better suited to the Argo software is to consider t=
he execution path, the full sequence of locks acquired, accesses performed, a=
nd locks released, from entering an operation, to the completion of the work=
.</span><br><span></span><br><span>An example code path for an operation:</s=
pan><br><span></span><br><span>`[entry] &gt; -- [ take R(L1) ] -- [ take R(L=
2) ] -- loop [ take a L3 / drop L3 ] -- &nbsp;[ drop R(L2) ] -- [ drop R(L1)=
] -- &gt; [exit]`</span><br><span></span><br><span>If a function implements a=
 section of the path, it is important to know not only what variables the fu=
nction itself operates upon, but also the locking state that will already ha=
ve been established at the point when the function is invoked, since this wi=
ll affect what data the function can access. For this reason, comments in th=
e code, or ASSERTs that explicitly check lock state, communicate what the lo=
cking state is expected and intended to be when that code is invoked. See th=
e macros defined to support this for Argo later in this document.</span><br>=
<span></span><br><span></span><br><span>## Macros to Validate and Document L=
ock State</span><br><span></span><br><span>These macros encode the logic to v=
erify that the locking has adhered to the locking discipline.</span><br><spa=
n></span><br><span>eg. On entry to logic that requires holding at least `R(r=
ings_L2)`, this:</span><br><span></span><br><span>`ASSERT(LOCKING_Read_rings=
_L2(d));`</span><br><span></span><br><span>checks that the lock state is suf=
ficient, validating that one of the following must be true when executed:</s=
pan><br><span></span><br><span>`R(rings_L2) &amp;&amp; R(L1)`</span><br><spa=
n>or: &nbsp;`W(rings_L2) &amp;&amp; R(L1)`</span><br><span>or: &nbsp;`W(L1)`=
</span><br><span></span><br><span>The macros are defined thus:</span><br><sp=
an></span><br><span>```</span><br><span>/* RAW macros here are only used to a=
ssist defining the other macros below */</span><br><span>#define RAW_LOCKING=
_Read_L1 (rw_is_locked(&amp;L1_global_argo_rwlock))</span><br><span>#define R=
AW_LOCKING_Read_rings_L2(d) \</span><br><span> &nbsp;&nbsp;(rw_is_locked(&am=
p;d-&gt;argo-&gt;rings_L2_rwlock) &amp;&amp; RAW_LOCKING_Read_L1)</span><br>=
<span></span><br><span>/* The LOCKING macros defined below here are for use a=
t verification points */</span><br><span>#define LOCKING_Write_L1 (rw_is_wri=
te_locked(&amp;L1_global_argo_rwlock))</span><br><span>#define LOCKING_Read_=
L1 (RAW_LOCKING_Read_L1 || LOCKING_Write_L1)</span><br><span></span><br><spa=
n>#define LOCKING_Write_rings_L2(d) \</span><br><span> &nbsp;&nbsp;((RAW_LOC=
KING_Read_L1 &amp;&amp; rw_is_write_locked(&amp;d-&gt;argo-&gt;rings_L2_rwlo=
ck)) || \</span><br><span> &nbsp;&nbsp;&nbsp;LOCKING_Write_L1)</span><br><sp=
an></span><br><span>#define LOCKING_Read_rings_L2(d) \</span><br><span> &nbs=
p;&nbsp;((RAW_LOCKING_Read_L1 &amp;&amp; rw_is_locked(&amp;d-&gt;argo-&gt;ri=
ngs_L2_rwlock)) || \</span><br><span> &nbsp;&nbsp;&nbsp;LOCKING_Write_rings_=
L2(d) || LOCKING_Write_L1)</span><br><span></span><br><span>#define LOCKING_=
L3(d, r) \</span><br><span> &nbsp;&nbsp;((RAW_LOCKING_Read_rings_L2(d) &amp;=
&amp; spin_is_locked(&amp;r-&gt;L3_lock)) || \</span><br><span> &nbsp;&nbsp;=
&nbsp;LOCKING_Write_rings_L2(d) || LOCKING_Write_L1)</span><br><span></span>=
<br><span>#define LOCKING_send_L2(d) \</span><br><span> &nbsp;&nbsp;((RAW_LO=
CKING_Read_L1 &amp;&amp; spin_is_locked(&amp;d-&gt;argo-&gt;send_L2_lock)) |=
| \</span><br><span> &nbsp;&nbsp;&nbsp;LOCKING_Write_L1)</span><br><span>```=
</span><br><span></span><br><span>Here is an example of a macro in use:</spa=
n><br><span></span><br><span>```</span><br><span>static void</span><br><span=
>notify_ring(const struct domain *d, struct argo_ring_info *ring_info,</span=
><br><span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;stru=
ct hlist_head *to_notify)</span><br><span>{</span><br><span> &nbsp;&nbsp;uin=
t32_t space;</span><br><span></span><br><span> &nbsp;&nbsp;ASSERT(LOCKING_Re=
ad_rings_L2(d));</span><br><span></span><br><span> &nbsp;&nbsp;spin_lock(&am=
p;ring_info-&gt;L3_lock);</span><br><span></span><br><span> &nbsp;&nbsp;if (=
 ring_info-&gt;len )</span><br><span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sp=
ace =3D ringbuf_payload_space(d, ring_info);</span><br><span> &nbsp;&nbsp;el=
se</span><br><span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;space =3D 0;</span><=
br><span></span><br><span> &nbsp;&nbsp;spin_unlock(&amp;ring_info-&gt;L3_loc=
k);</span><br><span></span><br><span> &nbsp;&nbsp;if ( space )</span><br><sp=
an> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pending_find(d, ring_info, space, to=
_notify);</span><br><span>}</span><br><span></span><br><span>```</span><br><=
span></span><br><span>In the above example, it can be seen that it is safe t=
o acquire the `L3` lock because _at least_ `R(rings_L2)` is already held, as=
 documented and verified by the macro.</span><br><span></span><br><span>## A=
ppendix: &nbsp;FAQ / Other Considerations </span><br><span></span><br><span>=
### Why not have a single per-domain lock?</span><br><span></span><br><span>=
Due to performance isolation / DoS avoidance: if there is a single per-domai=
n lock, acquiring this lock will stall operations on other active rings owne=
d by the domain. A malicious domain can loop registering and unregistering r=
ings, without any consent by the targetted domain, which would experience de=
creased throughput due to the contention on the single per-domain lock. The g=
ranular locking structure of Argo prevents this. It also allows concurrent o=
peration of different rings by multiple VCPUs of the same domain without con=
tention, to avoid negative application performance interaction.</span><br><s=
pan></span><br><span>## Rationale for Using a Singleton Global Lock: L1</spa=
n><br><span></span><br><span>### Teardown on domain destroy</span><br><span>=
</span><br><span>The single global lock enables exclusive access to the argo=
 data structures across domains when a domain is destroyed. Every unicast ri=
ng that the dying domain is the authorized sender is torn down and any pendi=
ng space-available notifications in other domain's wildcard rings are cancel=
led. This requires gaining safe access to the data structures on each of the=
 domains involved.</span><br><span></span><br><span>The 'send hashtable' dat=
a structure is needed in order to perform the teardown of rings when a domai=
n is destroyed. To populate it, whenever a unicast ring is registered, the l=
ock that protects that data structure must be taken exclusively.</span><br><=
span></span><br><span>There are granular per-domain locks which protect the p=
er-domain data structures. The global singleton L1 lock operates with-and-ab=
ove the per-domain locks and is used to obtain exclusive access to multiple d=
omain's argo data structures in the infrequent case where it is used -- for d=
omain destroy -- whilst otherwise allowing concurrent access, via acquiring i=
t with 'read' access, for the majority of the time.</span><br><span></span><=
br><span>To perform the required state teardown on domain destruction, which=
 can require removing state from the data structures of multiple domains, a l=
ocking protocol to obtain mutual exclusion and safe access to the state is r=
equired, without deadlocking.</span><br><span></span><br><span>Using the sin=
gle global lock avoids the need for sequencing the acquisition of multiple i=
ndividual per-domain locks (and lower level data structure locks) to prevent=
 deadlock: taking W(L1) grants access to all and taking R(L1) ensures that t=
eardown of any domain will not interfere with any Argo hypercall operation. I=
t enables introducing granular locking without complex or error-prone lock a=
cquisition logic.</span><br><span></span><br><span>=3D=3D=3D end document =3D=
=3D=3D</span><br><span></span><br><blockquote type=3D"cite"><span>There are a=
lso several claims that fine-grainer locking provides</span><br></blockquote=
><blockquote type=3D"cite"><span>better performance in order to justify the n=
eed of such locks. IMO</span><br></blockquote><blockquote type=3D"cite"><spa=
n>without providing any evidence of such performance benefit it's hard</span=
><br></blockquote><blockquote type=3D"cite"><span>to be convinced so many lo=
cks are needed.</span><br></blockquote><span></span><br><div dir=3D"ltr"><sp=
an style=3D"background-color: rgba(255, 255, 255, 0);">Benchmarks would be u=
seful for regression testing. &nbsp;</span>We can investigate resourcing for=
 Argo synthetic benchmarks in the Xen 4.13 release cycle. &nbsp;In the meant=
ime, we can cite the shipment of Citrix XenClient in 2011, followed by custo=
mer production deployments of v4v in OpenXT and Bromium uXen (including HP b=
usiness laptops). &nbsp;Argo is derived from v4v.</div><div dir=3D"ltr"><br>=
</div><div dir=3D"ltr">Ian Pratt's PSEC 2018 presentation [1] on hypervisor s=
ecurity indirectly referenced v4v and uXen isolation/performance requirement=
s, it may illustrate the scope of possible Argo use cases. &nbsp;Click the "=
uXen" button below the video to navigate to the clip. &nbsp;There's also a u=
Xen source code link. &nbsp;An excerpt (my annotations in []):</div><div dir=
=3D"ltr"><br></div><div dir=3D"ltr">"PV device interfaces all built on simpl=
e hypervisor copy-based primitive&nbsp;</div><div dir=3D"ltr"><br></div><div=
 dir=3D"ltr">We came up with a very simple primitive [v4v] for communication=
 between VMs, between VMs and the host, and then just built everything on th=
at primitive. &nbsp;It's a simple copy-based primitive. &nbsp;We didn't want=
 any memory sharing of any kind. &nbsp;Anything involving memory sharing end=
s up being complex ... Grant tables being a huge example ... a copy-based ap=
proach is just much simpler, and actually, performance-wise, it turns out be=
ing equivalent from a performance point of view ...&nbsp;</div><div dir=3D"l=
tr"><br></div><div dir=3D"ltr">Getting rid of other terrible ideas, like Xen=
store ... we still want the primitive [v4v] interface to be able to support t=
hings like device reconnection. &nbsp;That was a good idea, this idea that y=
ou can restart these driver domains, have VMs reconnect and be able to conti=
nue, that's very useful. &nbsp;We want to enable this simple primitive [v4v]=
 to do that. &nbsp;Then just build everything using very simple, narrow inte=
rfaces."</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">[1] &nbsp;<a href=3D=
"https://www.platformsecuritysummit.com/2018/speaker/pratt/">https://www.pla=
tformsecuritysummit.com/2018/speaker/pratt/</a></div><div dir=3D"ltr"><br></=
div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Regards,</div><div dir=3D"lt=
r">Rich</div></div></div></div></div></div></body></html>=

--Apple-Mail-F3FCEDFD-A193-440B-B09E-300675DDF006--


--===============5633118065446462266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5633118065446462266==--
